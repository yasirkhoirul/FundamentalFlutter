import 'package:flutter/material.dart';
import 'package:notification_app/provider/local_notificaiton_provider.dart';
import 'package:notification_app/screens/detail_screen.dart';
import 'package:notification_app/screens/home_screen.dart';
import 'package:notification_app/services/local_notification_service.dart';
import 'package:notification_app/static/my_route.dart';
import 'package:provider/provider.dart';

void main() async {
  String route = MyRoute.home.name;

  runApp(MultiProvider(
    providers: [
      //init() dijalankan sekali saja waktu LocalNotificationService 
      //pertama kali dibuat di dalam Provider(create: ...).
      Provider(
        create: (context) => LocalNotificationService()..init(),
      ),
      ChangeNotifierProvider(
        create: (context) =>
            LocalNotificaitonProvider(context.read<LocalNotificationService>())
              ..requestPermission(),
      )
    ],
    child: App(initialRoute: route),
  )
      // App(
      //   initialRoute: route,
      // ),
      );
}

class App extends StatelessWidget {
  final String initialRoute;

  const App({
    super.key,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      routes: {
        MyRoute.home.name: (context) => const HomeScreen(),
        MyRoute.detail.name: (context) => const DetailScreen(),
      },
    );
  }
}
