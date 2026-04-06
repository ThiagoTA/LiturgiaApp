import 'dart:io';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationRepository {
  NotificationRepository();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const int dailyLiturgyNotificationId = 1001;

  Future<void> init() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Sao_Paulo'));

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    const ios = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const settings = InitializationSettings(android: android, iOS: ios);

    await _plugin.initialize(settings);
  }

  Future<bool> requestPermission() async {
    bool granted = true;

    if (Platform.isAndroid) {
      final androidPlugin = _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      final result = await androidPlugin?.requestNotificationsPermission();
      granted = result ?? false;
    }

    if (Platform.isIOS) {
      final iosPlugin = _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();

      final result = await iosPlugin?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

      granted = result ?? false;
    }

    return granted;
  }

  Future<bool> requestExactAlarmPermission() async {
    if (!Platform.isAndroid) return true;

    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    final granted = await androidPlugin?.requestExactAlarmsPermission();

    return granted ?? false;
  }

  Future<void> scheduleDailyLiturgy({
    required int hour,
    required int minute,
    String title = 'Lembrete diário',
    String body = '',
  }) async {
    final granted = await requestPermission();
    if (!granted) return;

    await cancelDailyLiturgy();

    final messages = [
      'Está na hora de ler sua liturgia diária.',
      'Reserve um momento para a Palavra de hoje.',
      'Que tal um tempo de oração agora?',
      'A liturgia do dia está esperando por você.',
    ];

    final body = messages[Random().nextInt(messages.length)];

    final now = tz.TZDateTime.now(tz.local);

    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (!scheduled.isAfter(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    final exactGranted = await requestExactAlarmPermission();

    await _plugin.zonedSchedule(
      dailyLiturgyNotificationId,
      title,
      body,
      scheduled,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_liturgy_channel',
          'Liturgia diária',
          channelDescription: 'Lembretes diários da liturgia',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: exactGranted
          ? AndroidScheduleMode.exactAllowWhileIdle
          : AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelDailyLiturgy() async {
    await _plugin.cancel(dailyLiturgyNotificationId);
  }

  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }
}
