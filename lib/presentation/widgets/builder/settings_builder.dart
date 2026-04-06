import 'package:flutter/material.dart';
import 'package:liturgia_app/core/constants/settings_constants.dart';
import 'package:liturgia_app/core/database/app_database.dart';

import 'package:liturgia_app/data/repositories/settings_repository.dart';
import 'package:provider/provider.dart';

class SettingsBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, Setting settings) builder;

  const SettingsBuilder({super.key, required this.builder});

  Setting get defaultSettings => Setting(
    id: SettingsDefaults.settingsId,
    fontSize: SettingsDefaults.fontSizeDefault,
    continuousReading: SettingsDefaults.continuousReadingDefault,
    biblicalReference: SettingsDefaults.biblicalReferenceDefault,
    previousDays: SettingsDefaults.previousDaysDefault,
    futureDays: SettingsDefaults.futureDaysDefault,
    dailyNotificationEnabled: SettingsDefaults.dailyNotificationEnabled,
    dailyNotificationHour: SettingsDefaults.dailyNotificationHour,
    dailyNotificationMinute: SettingsDefaults.dailyNotificationMinute,
  );

  @override
  Widget build(BuildContext context) {
    final repository = context.read<SettingsRepository>();

    return StreamBuilder<Setting>(
      stream: repository.watchSettings(),
      initialData: defaultSettings,
      builder: (context, snapshot) {
        final settings = snapshot.data ?? defaultSettings;
        return builder(context, settings);
      },
    );
  }
}
