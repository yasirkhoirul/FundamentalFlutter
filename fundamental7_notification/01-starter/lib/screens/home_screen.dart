import 'package:flutter/material.dart';
import 'package:notification_app/provider/local_notificaiton_provider.dart';
import 'package:notification_app/widgets/my_divider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyDivider(title: "Notification"),
              ElevatedButton(
                onPressed: () async { 
                  await _requestPermission();
                },
                child: Consumer<LocalNotificaitonProvider>(

                  builder: (context,value,child) {
                    return Text(
                      "Request permission! ${value.permission}",
                      textAlign: TextAlign.center,
                    );
                  }
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _showNotification();
                },
                child: const Text(
                  "Show notification with payload and custom sound",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _showBigPictureNotification();
                },
                child: const Text(
                  "Show notification with big picture",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _scheduleDailyTenAMNotification();
                },
                child: const Text(
                  "Schedule daily 10:00:00 am notification",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _checkPendingNotificationRequests();
                },
                child: const Text(
                  "Check pending notifications",
                  textAlign: TextAlign.center,
                ),
              ),
              const MyDivider(title: "Background Service"),
              ElevatedButton(
                onPressed: () {
                  _runBackgroundOneOffTask();
                },
                child: const Text(
                  "Run a task in background",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _runBackgroundPeriodicTask();
                },
                child: const Text(
                  "Run a task periodically in background",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _cancelAllTaskInBackground();
                },
                child: const Text(
                  "Cancel all task in background",
                  textAlign: TextAlign.center,
                ),
              ),
              const MyDivider(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _requestPermission() async {
    context.read<LocalNotificaitonProvider>().requestPermission();
  }

  Future<void> _showNotification() async {
    context.read<LocalNotificaitonProvider>().showNotification();
  }

  Future<void> _showBigPictureNotification() async {}

  Future<void> _scheduleDailyTenAMNotification() async {}

  Future<void> _checkPendingNotificationRequests() async {}

  void _runBackgroundOneOffTask() async {}

  void _runBackgroundPeriodicTask() async {}

  void _cancelAllTaskInBackground() async {}
}
