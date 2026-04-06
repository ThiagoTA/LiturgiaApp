import 'package:liturgia_app/data/models/extras_model.dart';
import 'package:liturgia_app/data/models/reading_item_model.dart';

class ReadingModel {
  final List<ReadingItemModel> primeiraLeitura;
  final List<ReadingItemModel> segundaLeitura;
  final List<ReadingItemModel> salmo;
  final List<ReadingItemModel> evangelho;
  final List<ExtrasModel> extras;

  ReadingModel({
    required this.primeiraLeitura,
    required this.segundaLeitura,
    required this.salmo,
    required this.evangelho,
    required this.extras,
  });

  factory ReadingModel.fromJson(Map<String, dynamic> json) {
    List<ReadingItemModel> mapList(String key) {
      final list = json[key] as List<dynamic>? ?? [];
      return list
          .map((e) => ReadingItemModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    final extrasList = json['extras'] as List<dynamic>? ?? [];

    return ReadingModel(
      primeiraLeitura: mapList('primeiraLeitura'),
      segundaLeitura: mapList('segundaLeitura'),
      salmo: mapList('salmo'),
      evangelho: mapList('evangelho'),
      extras: extrasList.map((e) => ExtrasModel.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primeiraLeitura': primeiraLeitura.map((e) => e.toJson()).toList(),
      'segundaLeitura': segundaLeitura.map((e) => e.toJson()).toList(),
      'salmo': salmo.map((e) => e.toJson()).toList(),
      'evangelho': evangelho.map((e) => e.toJson()).toList(),
      'extras': extras.map((e) => e.toJson()).toList(),
    };
  }
}