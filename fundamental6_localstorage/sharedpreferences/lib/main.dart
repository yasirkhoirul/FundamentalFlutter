import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/providers/notification_state_provider.dart';
import 'package:sharedpreferences/providers/shared_preference_provider.dart';
import 'package:sharedpreferences/screens/setting_page.dart';
import 'package:sharedpreferences/service/shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotificationStateProvider(),
        ),
        Provider(create: (context) => SharedPreferenceService(prefs)),
        ChangeNotifierProvider(
          create: (context) =>
              SharedPreferenceProvider(context.read<SharedPreferenceService>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SettingPage(),
    );
  }
}
