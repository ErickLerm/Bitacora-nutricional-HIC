import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// 🔹 Fuentes amigables
const String fuentePrincipal = 'caveat';

// 🔹 TextStyles
class AppTextStyles {
  static const TextStyle titulo1 = TextStyle(
    fontFamily: fuentePrincipal,
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.titulo1,
  );

  static const TextStyle titulo2 = TextStyle(
    fontFamily: fuentePrincipal,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.titulo2,
  );

  static const TextStyle titulo3 = TextStyle(
    fontFamily: fuentePrincipal,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.titulo2,
  );

  static const TextStyle parrafo = TextStyle(
    fontFamily: fuentePrincipal,
    fontSize: 22,
    color: AppColors.parrafo,
    height: 1.5,
  );

  static const TextStyle boton = TextStyle(
    color: Colors.white, 
    fontSize: 16, 
    fontWeight: FontWeight.bold
  );
} 