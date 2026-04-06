import 'package:liturgia_app/data/models/antiphons_model.dart';
import 'package:liturgia_app/data/models/prayer_model.dart';
import 'package:liturgia_app/data/models/reading_model.dart';

class LiturgyModel {
  final String data;
  final String liturgia;
  final String cor;
  final PrayerModel oracoes;
  final ReadingModel leituras;
  final AntiphonsModel antifonas;

  LiturgyModel({
    required this.data,
    required this.liturgia,
    required this.cor,
    required this.oracoes,
    required this.leituras,
    required this.antifonas,
  });

  factory LiturgyModel.fromJson(Map<String, dynamic> json) {
    final oracoesJson = json['oracoes'] as Map<String, dynamic>? ?? {};
    final leiturasJson = json['leituras'] as Map<String, dynamic>? ?? {};
    final antifonasJson = json['antifonas'] as Map<String, dynamic>? ?? {};

    return LiturgyModel(
      data: json['data'] ?? '',
      liturgia: json['liturgia'] ?? '',
      cor: json['cor'] ?? '',
      oracoes: PrayerModel.fromJson(oracoesJson),
      leituras: ReadingModel.fromJson(leiturasJson),
      antifonas: AntiphonsModel.fromJson(antifonasJson),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'liturgia': liturgia,
      'cor': cor,
      'oracoes': oracoes.toJson(),
      'leituras': leituras.toJson(),
      'antifonas': antifonas.toJson(),
    };
  }
}
