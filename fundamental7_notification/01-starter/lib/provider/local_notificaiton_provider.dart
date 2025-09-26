import 'package:flutter/widgets.dart';
import 'package:notification_app/services/local_notification_service.dart';

class LocalNotificaitonProvider extends ChangeNotifier {
  final LocalNotificationService notificationService;
  LocalNotificaitonProvider(this.notificationService);

  int _notificationId = 0;
  bool? _permision = false;
  bool? get permission => _permision;

  Future requestPermission() async {
    _permision = await notificationService.requestPermission();
    notifyListeners();
  }

  void showNotification() {
    _notificationId += 1;
    notificationService.showNotification(
        id: _notificationId,
        title: "new notifikasi",
        body: "ini adlaah notifikasi dengan ud $_notificationId",
        payload: "ini adalah payload dengan id notifikasi $_notificationId");
  }

  
}
