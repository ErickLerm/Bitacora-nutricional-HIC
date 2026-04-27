import 'package:flutter/material.dart';

Future<void> mostrarDialogoInfantil({
  required BuildContext context,
  required String titulo,
  required String mensaje,
  required IconData icono,
  required Color color,
}){
  return showDialog<void>(
    context: context,
    barrierDismissible: true, 
    builder: (_){
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 92,
                height: 92,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.14),
                ),
                child: Icon(icono, size: 52, color: color),
              ),
              const SizedBox(height: 18),
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                mensaje,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  '¡OK!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  );
}




void mostrarSnackBarEliminado(BuildContext context){
  final mensajero = ScaffoldMessenger.of(context);
  mensajero.hideCurrentSnackBar();


  mensajero.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      elevation: 10,
      margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      duration: const Duration(seconds: 2),
      content: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.withOpacity(0.14),
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Platillo limpiado',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}