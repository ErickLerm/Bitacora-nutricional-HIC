import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bienvenida_screen.dart';
import '../widgets/custom_navbar.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('settings');
    final user = box.get('user');

    // 👇 Primera vez
    if (user == null) {
      return const BienvenidaScreen();
    }

    // 👇 Ya configurado
    return const CustomNavbar();
  }
}