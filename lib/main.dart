import 'package:flutter/material.dart';
import 'widgets/custom_navbar.dart';
import 'theme/app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/start_screen.dart'; // 👈 nueva pantalla

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(); // 🔹 Inicializa Hive
  await Hive.openBox('settings'); // 🔹 Abre la caja

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const StartScreen(), 
    );
  }
}