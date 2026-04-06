import 'package:liturgia_app/core/constants/settings_constants.dart';
import 'package:liturgia_app/core/database/app_database.dart';
import 'package:liturgia_app/data/daos/liturgy_dao.dart';
import 'package:liturgia_app/data/daos/settings_dao.dart';
import 'package:liturgia_app/data/repositories/notification_repository.dart';

class SettingsRepository {
  final SettingsDao _settingsDao;
  final LiturgyDao _liturgyDao;
  final NotificationRepository _notificationRepository;

  SettingsRepository(
    this._settingsDao,
    this._liturgyDao,
    this._notificationRepository,
  );

  Future<void> init() async {
    await _settingsDao.ensureSettings();
  }

  Future<Setting> getSettings() {
    return _settingsDao.getSettings();
  }

  Stream<Setting> watchSettings() {
    return _settingsDao.watchSettings();
  }

  Future<void> increaseFontSize() async {
    final settings = await _settingsDao.getSettings();
    final newValue = (settings.fontSize + 1).clamp(
      SettingsDefaults.fontSizeMin,
      SettingsDefaults.fontSizeMax,
    );
    await _settingsDao.updateFontSize(newValue);
  }

  Future<void> decreaseFontSize() async {
    final settings = await _settingsDao.getSettings();
    final newValue = (settings.fontSize - 1).clamp(
      SettingsDefaults.fontSizeMin,
      SettingsDefaults.fontSizeMax,
    );
    await _settingsDao.updateFontSize(newValue);
  }

  Future<void> updateContinuousReading(bool value) {
    return _settingsDao.updateContinuousReading(value);
  }

  Future<void> updateBiblicalReference(bool value) {
    return _settingsDao.updateBiblicalReference(value);
  }

  Future<void> increasePreviousDays() async {
    final settings = await _settingsDao.getSettings();
    final newValue = (settings.previousDays + 1).clamp(
      SettingsDefaults.previousDaysMin,
      SettingsDefaults.previousDaysMax,
    );
    await _settingsDao.updatePreviousDays(newValue);
  }

  Future<void> decreasePreviousDays() async {
    final settings = await _settingsDao.getSettings();
    final newValue = (settings.previousDays - 1).clamp(
      SettingsDefaults.previousDaysMin,
      SettingsDefaults.previousDaysMax,
    );
    await _settingsDao.updatePreviousDays(newValue);
  }

  Future<void> increaseFutureDays() async {
    final settings = await _settingsDao.getSettings();
    final newValue = (settings.futureDays + 1).clamp(
      SettingsDefaults.futureDaysMin,
      SettingsDefaults.futureDaysMax,
    );
    await _settingsDao.updateFutureDays(newValue);
  }

  Future<void> decreaseFutureDays() async {
    final settings = await _settingsDao.getSettings();
    final newValue = (settings.futureDays - 1).clamp(
      SettingsDefaults.futureDaysMin,
      SettingsDefaults.futureDaysMax,
    );
    await _settingsDao.updateFutureDays(newValue);
  }

  Future<void> updateDailyNotificationEnabled(bool enabled) async {
    await _settingsDao.updateDailyNotificationEnabled(enabled);

    final settings = await _settingsDao.getSettings();

    if (enabled) {
      await _notificationRepository.scheduleDailyLiturgy(
        hour: settings.dailyNotificationHour,
        minute: settings.dailyNotificationMinute,
      );
    } else {
      await _notificationRepository.cancelDailyLiturgy();
    }
  }

  Future<void> updateDailyNotificationTime({
    required int hour,
    required int minute,
  }) async {
    await _settingsDao.updateDailyNotificationTime(hour, minute);

    final settings = await _settingsDao.getSettings();

    if (settings.dailyNotificationEnabled) {
      await _notificationRepository.scheduleDailyLiturgy(
        hour: hour,
        minute: minute,
      );
    }
  }
  
  Future<void> resetSettings() {
    updateDailyNotificationTime(
      hour: SettingsDefaults.dailyNotificationHour, 
      minute: SettingsDefaults.dailyNotificationMinute
    );

    return _settingsDao.resetSettings(
      fontSize: SettingsDefaults.fontSizeDefault,
      continuousReading: SettingsDefaults.continuousReadingDefault,
      biblicalReference: SettingsDefaults.biblicalReferenceDefault,
      previousDays: SettingsDefaults.previousDaysDefault,
      futureDays: SettingsDefaults.futureDaysDefault,
      dailyNotificationEnabled: SettingsDefaults.dailyNotificationEnabled,
      dailyNotificationHour: SettingsDefaults.dailyNotificationHour,
      dailyNotificationMinute: SettingsDefaults.dailyNotificationMinute,
    );
  }

  Future<void> clearLiturgy() {
    return _liturgyDao.deleteAll();
  }
}
