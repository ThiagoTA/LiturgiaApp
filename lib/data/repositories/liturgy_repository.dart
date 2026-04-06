import 'package:liturgia_app/core/database/app_database.dart';
import 'package:liturgia_app/core/exceptions/app_exceptions.dart';
import 'package:liturgia_app/core/utils/time_utils.dart';
import 'package:liturgia_app/data/daos/liturgy_dao.dart';
import 'package:liturgia_app/data/models/liturgy_model.dart';
import 'package:liturgia_app/data/repositories/settings_repository.dart';
import 'package:liturgia_app/data/service/remote/liturgy_service.dart';

import 'dart:convert';

class LiturgyRepository {
  final LiturgyService service;
  final LiturgyDao dao;
  final SettingsRepository _settingsRepository;

  LiturgyRepository(this.service, this.dao, this._settingsRepository);

  Future<LiturgyModel> getLiturgy({
    required int day,
    required int month,
    int? year,
  }) async {
    final dateKey = buildDateKey(day: day, month: month, year: year);

    try {
      final liturgy = await service.fetchLiturgy(day: day, month: month);

      final liturgiesCompanion = LiturgiesCompanion.insert(
        date: normalizeApiDate(liturgy.data),
        json: jsonEncode(liturgy.toJson()),
        updatedAt: DateTime.now().toIso8601String(),
      );

      await dao.insertLiturgy(liturgiesCompanion);

      return liturgy;
    } on NetworkException {
      final cached = await dao.getByDate(dateKey);

      if (cached != null) {
        return fromDbRow(cached);
      }

      throw NetworkException(
        'Sem conexão e não há liturgia salva para esta data.',
      );
    }
  }

  Future<List<LiturgyModel>> getLiturgyForPeriod() async {
    final settings = await _settingsRepository.getSettings();

    final liturgies = await service.fetchLiturgyForPeriod(period: 7);

    final items = liturgies.map((e) {
      return LiturgiesCompanion.insert(
        date: normalizeApiDate(e.data),
        json: jsonEncode(e.toJson()),
        updatedAt: DateTime.now().toIso8601String(),
      );
    }).toList();

    await dao.insertManyLiturgies(items);

    await deleteLiturgies(
      previousDays: settings.previousDays,
      futureDays: settings.futureDays,
    );

    return liturgies;
  }

  Future<void> deleteLiturgies({
    required int previousDays,
    required int futureDays,
  }) async {
    final now = DateTime.now();

    final minDate = now.subtract(Duration(days: previousDays));
    final maxDate = now.add(Duration(days: futureDays));

    final minKey = buildDateKey(
      day: minDate.day,
      month: minDate.month,
      year: minDate.year,
    );

    final maxKey = buildDateKey(
      day: maxDate.day,
      month: maxDate.month,
      year: maxDate.year,
    );

    await dao.deleteBeforeDate(minKey);
    await dao.deleteAfterDate(maxKey);
  }
}

LiturgyModel fromDbRow(Liturgy row) {
  final map = jsonDecode(row.json) as Map<String, dynamic>;
  return LiturgyModel.fromJson(map);
}