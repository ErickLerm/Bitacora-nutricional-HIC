import 'package:app_pvvc/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AccionesComida extends StatelessWidget {
  final VoidCallback alAgregarAlimento;
  final VoidCallback alEliminarAlimento;
  final bool compacto;

  const AccionesComida({
    super.key,
    this.compacto = false,
    required this.alAgregarAlimento,
    required this.alEliminarAlimento,
  });

  @override
  Widget build(BuildContext context) {
    final double fontSize = compacto ? 11.0 : 14.0;
    final double iconSize = compacto ? 16.0 : 22.0;
    final double paddingHorizontal = compacto ? 8.0 : 16.0;
    final double paddingVertical = compacto ? 6.0 : 10.0;
    final double espacio = compacto ? 6.0 : 10.0;

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: espacio,
      runSpacing: espacio,
      children: [
        ElevatedButton.icon(
          onPressed: alAgregarAlimento,
          icon: Icon(Icons.add_circle_outline, size: iconSize),
          label: Text(
            'Agregar alimento',
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w800),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.g1,
            foregroundColor: Colors.black87,
            elevation: 0,
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
              vertical: paddingVertical,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size(0, 36),
          ).copyWith(elevation: WidgetStateProperty.all(0)),
        ),
        OutlinedButton.icon(
          onPressed: alEliminarAlimento,
          icon: Icon(Icons.delete, size: iconSize),
          label: Text(
            'Limpiar platillo',
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w800),
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black87,
            backgroundColor: AppColors.g3,
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
              vertical: paddingVertical,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            side: BorderSide(color: Colors.grey.shade300, width: 1.4),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size(0, 38),
          ),
        ),
      ],
    );
  }
}
