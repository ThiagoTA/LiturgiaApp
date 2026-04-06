import 'package:liturgia_app/data/models/extras_model.dart';

class PrayerModel {
  final String coleta;
  final String oferendas;
  final String comunhao;
  final List<ExtrasModel> extras;

  PrayerModel({
    required this.coleta,
    required this.oferendas,
    required this.comunhao,
    required this.extras,
  });

  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    final extrasList = json['extras'] as List<dynamic>? ?? [];

    return PrayerModel(
      coleta: json['coleta'] ?? '',
      oferendas: json['oferendas'] ?? '',
      comunhao: json['comunhao'] ?? '',
      extras: extrasList
          .map((e) => ExtrasModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coleta': coleta,
      'oferendas': oferendas,
      'comunhao': comunhao,
      'extras': extras.map((e) => e.toJson()).toList(),
    };
  }
}
