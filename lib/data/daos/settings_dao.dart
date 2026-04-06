import 'package:drift/drift.dart';
import 'package:liturgia_app/core/constants/settings_constants.dart';
import 'package:liturgia_app/core/database/app_database.dart';
import 'package:liturgia_app/data/tables/settings_table.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [Settings])
class SettingsDao extends DatabaseAccessor<AppDatabase>
    with _$SettingsDaoMixin {
  SettingsDao(AppDatabase db) : super(db);

  static const _settingsId = SettingsDefaults.settingsId;

  Future<void> ensureSettings() async {
    await into(
      settings,
    ).insertOnConflictUpdate(SettingsCompanion(id: const Value(_settingsId)));
  }

  Future<Setting> getSettings() {
    return (select(
      settings,
    )..where((t) => t.id.equals(_settingsId))).getSingle();
  }

  Stream<Setting> watchSettings() {
    return (select(
      settings,
    )..where((t) => t.id.equals(_settingsId))).watchSingle();
  }

  Future<void> updateFontSize(int value) {
    return (update(settings)..where((t) => t.id.equals(_settingsId))).write(
      SettingsCompanion(fontSize: Value(value)),
    );
  }

  Future<void> updateContinuousReading(bool value) {
    return (update(settings)..where((t) => t.id.equals(_settingsId))).write(
      SettingsCompanion(continuousReading: Value(value)),
    );
  }

  Future<void> updateBiblicalReference(bool value) {
    return (update(settings)..where((t) => t.id.equals(_settingsId))).write(
      SettingsCompanion(biblicalReference: Value(value)),
    );
  }

  Future<void> updatePreviousDays(int value) {
    return (update(settings)..where((t) => t.id.equals(_settingsId))).write(
      SettingsCompanion(previousDays: Value(value)),
    );
  }

  Future<void> updateFutureDays(int value) {
    return (update(settings)..where((t) => t.id.equals(_settingsId))).write(
      SettingsCompanion(futureDays: Value(value)),
    );
  }

  Future<void> updateDailyNotificationEnabled(bool value) {
    return (update(settings)..where((t) => t.id.equals(_settingsId))).write(
      SettingsCompanion(dailyNotificationEnabled: Value(value))
    );
  }

  Future<void> updateDailyNotificationTime(int hour, int minute) {
    return (update(settings)
          ..where((t) => t.id.equals(_settingsId)))
        .write(
      SettingsCompanion(
        dailyNotificationHour: Value(hour),
        dailyNotificationMinute: Value(minute),
      ),
    );
  }

  Future<void> resetSettings({
    required int fontSize,
    required bool continuousReading,
    required bool biblicalReference,
    required int previousDays,
    required int futureDays,
    required bool dailyNotificationEnabled,
    required int dailyNotificationHour,
    required int dailyNotificationMinute,
  }) {
    return (update(settings)..where((t) => t.id.equals(_settingsId))).write(
      SettingsCompanion(
        fontSize: Value(fontSize),
        continuousReading: Value(continuousReading),
        biblicalReference: Value(biblicalReference),
        previousDays: Value(previousDays),
        futureDays: Value(futureDays),
        dailyNotificationEnabled: Value(dailyNotificationEnabled),
        dailyNotificationHour: Value(dailyNotificationHour),
        dailyNotificationMinute: Value(dailyNotificationMinute),
      ),
    );
  }
}
