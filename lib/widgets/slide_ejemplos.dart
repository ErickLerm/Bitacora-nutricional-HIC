import 'package:app_pvvc/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SliderImagenes extends StatefulWidget {
  const SliderImagenes({super.key});

  @override
  _SliderImagenesState createState() => _SliderImagenesState();
}

class _SliderImagenesState extends State<SliderImagenes> {
  int _indiceActual = 0;

  final List<String> _imagenes = [
    'assets/info/ejemplo_desayuno.png',
    'assets/info/ejemplo_comida.png',
    'assets/info/ejemplo_lunch.png',
  ];

  void siguiente() {
    setState(() {
      _indiceActual = (_indiceActual + 1) % _imagenes.length;
    });
  }

  void anterior() {
    setState(() {
      _indiceActual = (_indiceActual - 1 + _imagenes.length) % _imagenes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double ancho = constraints.maxWidth;

        return Stack(
          alignment: Alignment.center,
          children: [
            // Imagen con shadow, animación fade y soporte swipe
            GestureDetector(
              onHorizontalDragEnd: (details) {
                // Detecta swipe
                if (details.primaryVelocity != null) {
                  if (details.primaryVelocity! < 0) {
                    // Swipe hacia la izquierda → siguiente
                    siguiente();
                  } else if (details.primaryVelocity! > 0) {
                    // Swipe hacia la derecha → anterior
                    anterior();
                  }
                }
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: Container(
                  key: ValueKey<int>(_indiceActual),
                  width: ancho,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      _imagenes[_indiceActual],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            // Flecha izquierda
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.chevron_left, size: 40, color: AppColors.background),
                onPressed: anterior,
              ),
            ),

            // Flecha derecha
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.chevron_right, size: 40, color: AppColors.background),
                onPressed: siguiente,
              ),
            ),
          ],
        );
      },
    );
  }
}