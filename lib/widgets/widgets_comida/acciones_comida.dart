import 'package:app_pvvc/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AccionesComida extends StatelessWidget{
  final VoidCallback alAgregarAlimento;
  final VoidCallback alEliminarAlimento;

  const AccionesComida({
    super.key,
    required this.alAgregarAlimento,
    required this.alEliminarAlimento,
  });

  @override
  Widget build(BuildContext context){
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 14,
      runSpacing: 12,
      children: [
        ElevatedButton.icon(
          onPressed: alAgregarAlimento,
          icon: const Icon(Icons.add_circle_outline),
          label: const Text('Agregar alimento'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.g1,
            foregroundColor:  Colors.black87,
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: Colors.grey.shade300
              ),
            )
          ).copyWith(
            elevation: WidgetStateProperty.all(0),
          ),
        ),
        OutlinedButton.icon(
          onPressed: alEliminarAlimento,
          icon: const Icon(Icons.delete),
          label: const Text('Limpiar plato'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black87,
            backgroundColor: AppColors.g3,
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 16
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            side: BorderSide(
              color: Colors.grey.shade300,
              width: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}