import 'package:liturgia_app/core/constants/api_constants.dart';
import 'package:liturgia_app/core/exceptions/app_exceptions.dart';
import 'package:liturgia_app/data/models/liturgy_model.dart';
import 'package:liturgia_app/core/network/api_client.dart';

class LiturgyService {
  final ApiClient apiClient;

  LiturgyService(this.apiClient);

  Future<LiturgyModel> fetchLiturgy({
    required int day,
    required int month,
  }) async {
    final url = '${ApiConstants.baseUrl}?dia=$day&mes=$month';

    final response = await apiClient.get(url);

    if (response.statusCode == 200) {
      try {
        return LiturgyModel.fromJson(response.data);
      } catch (_) {
        throw ParseException('Erro ao interpretar os dados da liturgia.');
      }
    }

    if (response.statusCode == 404) {
      throw LiturgyNotFoundException(
        response.data['erro']?.toString() ??
            'Não encontramos nenhuma liturgia para esta data.',
      );
    }

    throw ApiException(
      response.data['erro']?.toString() ??
          'Erro ao buscar liturgia (${response.statusCode}).',
    );
  }

  Future<List<LiturgyModel>> fetchLiturgyForPeriod({int period = 7}) async {
    final url = '${ApiConstants.baseUrl}?periodo=$period';

    final response = await apiClient.get(url);

    print('STATUS: ${response.statusCode}');
    print('BODY: ${response.data}');

    if (response.statusCode == 200) {
      try {
        final List dataList = response.data as List;
        return dataList.map((data) => LiturgyModel.fromJson(data)).toList();
      } catch (e) {
        print('ERRO PARSE PERIODO: $e');
        throw ParseException('Erro ao interpretar os dados da liturgia.');
      }
    }

    throw ApiException(
      response.data['erro']?.toString() ??
          'Erro ao buscar liturgia (${response.statusCode}).',
    );
  }
}
