import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:app_pvvc/modelos/item_platillo.dart';
import 'package:app_pvvc/datos/bd_alimentos.dart';

class ServicioPlatillos {
  static const String nombreCaja = 'meal_reports';

  static DateTime normalizarFecha(DateTime fecha) {
    return DateTime(fecha.year, fecha.month, fecha.day);
  }

  static String formatearFechaClave(DateTime fecha) {
    final f = normalizarFecha(fecha);
    final year = f.year.toString();
    final month = f.month.toString().padLeft(2, '0');
    final day = f.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  static String crearClave({
    DateTime? fecha,
    String? dia,
    required String tipoComida,
  }) {
    if (fecha != null) {
      return '${formatearFechaClave(fecha)}|$tipoComida';
    }

    // Compatibilidad con claves antiguas tipo "Lunes|Desayuno"
    if (dia != null) {
      return '$dia|$tipoComida';
    }

    throw ArgumentError('Debes enviar fecha o dia.');
  }

  static List<ItemPlatillo> clonarItems(List<ItemPlatillo> origen) {
    return origen.map((item) => item.copiar()).toList();
  }

  static Future<void> guardarPlatillo({
    DateTime? fecha,
    String? dia,
    required String tipoComida,
    required List<ItemPlatillo> platillo,
    required Map<String, List<ItemPlatillo>> platillosGuardados,
  }) async {
    final clave = crearClave(
      fecha: fecha,
      dia: dia,
      tipoComida: tipoComida,
    );

    platillosGuardados[clave] = clonarItems(platillo);

    final caja = Hive.box(nombreCaja);

    final alimentosParaGuardar = platillo.map((item) {
      return {
        'name': item.alimento.nombre,
        'category': item.alimento.categoria,
        'image': item.alimento.imagen,
        'dx': item.posicion.dx,
        'dy': item.posicion.dy,
      };
    }).toList();

    await caja.put(clave, alimentosParaGuardar);
  }

  static List<ItemPlatillo> cargarPlatillo({
    DateTime? fecha,
    String? dia,
    required String tipoComida,
    required Map<String, List<ItemPlatillo>> platillosGuardados,
  }) {
    final clave = crearClave(
      fecha: fecha,
      dia: dia,
      tipoComida: tipoComida,
    );

    final guardadoEnMemoria = platillosGuardados[clave];

    if (guardadoEnMemoria != null) {
      return clonarItems(guardadoEnMemoria);
    }

    final caja = Hive.box(nombreCaja);
    final datosHive = caja.get(clave);

    if (datosHive is! List) {
      return [];
    }

    final restaurado = <ItemPlatillo>[];

    for (final item in datosHive) {
      if (item is Map) {
        final nombre = item['name']?.toString() ?? '';
        final categoria = item['category']?.toString() ?? '';
        final dx = (item['dx'] as num?)?.toDouble() ?? 0.5;
        final dy = (item['dy'] as num?)?.toDouble() ?? 0.5;

        try {
          final alimentoEncontrado = alimentos.firstWhere(
            (alimento) =>
                alimento.nombre == nombre && alimento.categoria == categoria,
          );

          restaurado.add(
            ItemPlatillo(
              alimento: alimentoEncontrado,
              posicion: Offset(dx, dy),
            ),
          );
        } catch (_) {}
      }
    }

    return restaurado;
  }
}