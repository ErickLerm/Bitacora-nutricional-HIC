import 'package:flutter/material.dart';

class ImagenCircularTransparente extends StatelessWidget {
  final String imagen;
  final double maxSize; // tamaño máximo del círculo

  const ImagenCircularTransparente({
    required this.imagen,
    this.maxSize = 350, // valor por defecto
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calcula el tamaño: nunca mayor al ancho disponible ni mayor a maxSize
        double size = constraints.maxWidth < maxSize ? constraints.maxWidth : maxSize;

        return SizedBox(
          width: size,
          height: size,
          child: ClipOval(
            child: Image.asset(
              imagen,
              fit: BoxFit.cover, // cubre el círculo sin deformar
            ),
          ),
        );
      },
    );
  }
}