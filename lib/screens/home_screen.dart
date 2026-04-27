import 'package:flutter/material.dart';
import '../utils/styles.dart';
import '../theme/app_colors.dart';
import '../widgets/slide_ejemplos.dart';
import '../widgets/avance_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int) onTabChange;

  const HomeScreen({super.key, required this.onTabChange});

  String obtenerPrimerNombre() {
    final box = Hive.box('settings');
    final user = box.get('user');

    if (user != null && user['nombre'] != null) {
      String nombreCompleto = user['nombre'];
      return nombreCompleto.split(' ')[0];
    }
    return 'Usuario';
  }

  @override
  Widget build(BuildContext context) {
    final fechaHoy = DateTime.now();

    final meses = [
      "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
      "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
    ];

    final fechaFormateada =
        "${fechaHoy.day} de ${meses[fechaHoy.month - 1]} de ${fechaHoy.year}";

    return Scaffold(                    // ← Igual que SettingsScreen
      body: Align(
        alignment: Alignment.topCenter,   // ← Arriba y centrado horizontal
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),   // ← Padding uniforme

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // 🔹 CARD PRINCIPAL
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // FECHA
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.today,
                              color: AppColors.titulo2, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            fechaFormateada,
                            style: AppTextStyles.titulo2,
                          ),
                        ],
                      ),

                      const Divider(
                        color: AppColors.titulo2,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),

                      const SizedBox(height: 10),

                      // SALUDO
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.waving_hand,
                              color: AppColors.titulo2, size: 30),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              "Hola, ${obtenerPrimerNombre()}",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.titulo1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // PROGRESO
                const ProgresoDia(),

                const SizedBox(height: 30),

                // SLIDER
                const SliderImagenes(),

                const SizedBox(height: 30),

                // BOTÓN - Centrado
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () => onTabChange(2),
                    icon: const Icon(Icons.dining, color: Colors.white),
                    label: const Text(
                      "Crear Plato",
                      style: AppTextStyles.boton,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}