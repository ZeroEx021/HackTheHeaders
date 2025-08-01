import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../models/alarm.dart';

class AlarmService {
  final _notifications = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _notifications.initialize(settings);
  }

  Future<void> scheduleAlarm(Alarm alarm) async {
    final androidDetails = AndroidNotificationDetails(
      'alarm_channel',
      'Alarmas',
      channelDescription: 'Alarma de Despiertate Ya',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    await _notifications.show(
      alarm.id,
      'Alarma',
      'Hora de despertar',
      NotificationDetails(android: androidDetails),
    );
  }
}
