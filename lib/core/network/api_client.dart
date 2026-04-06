import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liturgia_app/core/exceptions/app_exceptions.dart';

class ApiResponse {
  final int statusCode;
  final dynamic data;

  ApiResponse({
    required this.statusCode,
    required this.data,
  });
}

class ApiClient {
  final http.Client client;

  ApiClient(this.client);

  Future<ApiResponse> get(String url) async {
    try {
      final response = await client.get(Uri.parse(url));
      final decoded = jsonDecode(response.body);

      return ApiResponse(
        statusCode: response.statusCode,
        data: decoded,
      );
    } catch (e) {
      if (e is AppException) rethrow;
      throw NetworkException('Erro de conexão com o servidor.');
    }
  }
}
