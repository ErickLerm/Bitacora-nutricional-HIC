import 'package:app_pvvc/modelos/alimento.dart';
import 'package:flutter/material.dart';


class ItemPlatillo {
  final Alimento alimento;
  Offset posicion;

  ItemPlatillo({
    required this.alimento,
    required this.posicion,
  });

  ItemPlatillo copiar() {
    return ItemPlatillo(
      alimento: alimento,
      posicion: Offset(posicion.dx, posicion.dy),
    );
  }
}