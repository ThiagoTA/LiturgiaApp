import 'package:drift/drift.dart';
import 'package:liturgia_app/core/constants/settings_constants.dart';

class Settings extends Table {
  IntColumn get id => integer()();
  IntColumn get fontSize => integer().withDefault(const Constant(SettingsDefaults.fontSizeDefault))();
  BoolColumn get continuousReading => boolean().withDefault(const Constant(SettingsDefaults.continuousReadingDefault))();
  BoolColumn get biblicalReference => boolean().withDefault(const Constant(SettingsDefaults.biblicalReferenceDefault))();
  IntColumn get previousDays => integer().withDefault(const Constant(SettingsDefaults.previousDaysDefault))();
  IntColumn get futureDays => integer().withDefault(const Constant(SettingsDefaults.futureDaysDefault))();
  BoolColumn get dailyNotificationEnabled => boolean().withDefault(const Constant(SettingsDefaults.dailyNotificationEnabled))();
  IntColumn get dailyNotificationHour => integer().withDefault(const Constant(SettingsDefaults.dailyNotificationHour))();
  IntColumn get dailyNotificationMinute => integer().withDefault(const Constant(SettingsDefaults.dailyNotificationMinute))();

  @override
  Set<Column> get primaryKey => {id};
}