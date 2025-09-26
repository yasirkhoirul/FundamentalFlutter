import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class LocalNotificationService {
  // Selanjutnya, tambahkan fungsi init()untuk menginisialisasi fitur notifikasi.
  //Fungsi ini mengandung beberapa konfigurasi, seperti ikon notifikasi pada Android,
  //notification permission pada iOS, dan callback function apabila mendapatkan notifikasi
  //dalam foreground atau background.
  Future init() async {
    const initializtionsettingAndroid =
        AndroidInitializationSettings('app_icon');
    const initializtionDarwin = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false);
    const initializationsetting = InitializationSettings(
        android: initializtionsettingAndroid, iOS: initializtionDarwin);

    await flutterLocalNotificationsPlugin.initialize(initializationsetting);
  }

  //, tambahkan fungsi untuk memeriksa permission atau perizinan terkait notifikasi.
  //Hal ini diperlukan karena Android 13 ke atas memiliki restriksi dalam menampilkan notifikasi.
  Future _checkPermisionAndroid() async {
    return await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.areNotificationsEnabled() ??
        false;
  }

  Future _requestPermissionAndroid() async {
    return await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission() ??
        false;
  }

  Future requestPermission() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iosImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>();
      return await iosImplementation?.requestPermissions(
          alert: true, badge: true, sound: true);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      final notificationenable = await _checkPermisionAndroid();
      if (!notificationenable) {
        final getRequestPermession = await _requestPermissionAndroid();

        return getRequestPermession;
      }
      return notificationenable;
    } else {
      return false;
    }
  }

  // show notification

  Future showNotification(
      {required int id,
      required String title,
      required String body,
      required String payload,
      String channelid = "1",
      String channelName = "Simple Notification"}) async {
    final androidPlatformChannelspecific = AndroidNotificationDetails(
        channelid, channelName,
        importance: Importance.max, priority: Priority.high);
    final iosPlatformChannelSpesific = DarwinNotificationDetails();

    final notificationdetail = NotificationDetails(
        android: androidPlatformChannelspecific,
        iOS: iosPlatformChannelSpesific);

    await flutterLocalNotificationsPlugin
        .show(id, title, body, notificationdetail, payload: payload);
  }
}
