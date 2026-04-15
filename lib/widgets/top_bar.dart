import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary, // 🔥 este pinta el notch
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: Center(
            child: Image.asset(
              'assets/hic/logoBlanco.png',
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}