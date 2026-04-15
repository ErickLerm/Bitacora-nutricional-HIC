import 'package:flutter/material.dart';
import '../utils/styles.dart'; 
import '../theme/app_colors.dart'; 

class ProgresoDia extends StatefulWidget {
  const ProgresoDia({super.key});

  @override
  _ProgresoDiaState createState() => _ProgresoDiaState();
}

class _ProgresoDiaState extends State<ProgresoDia> {
  // Estado de cada comida: false = no completada, true = completada
  List<bool> _completado = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final comidas = ["Desayuno", "Comida", "Cena"];
    final iconos = [Icons.free_breakfast, Icons.lunch_dining, Icons.dinner_dining];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center, // centra horizontalmente
        children: [
          const Icon(Icons.bar_chart, color: AppColors.titulo2, size: 24), // ícono a la izquierda
          const SizedBox(width: 8), // espacio entre ícono y texto
          Text(
            "Progreso del Día",
            style: AppTextStyles.titulo2,
          ),
        ],
      ),

            // Línea horizontal
      Divider(
        color: AppColors.titulo2,
        thickness: 1,
        indent: 5,
        endIndent: 5,
      ),



          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _completado[index] = !_completado[index]; // marcar/desmarcar
                  });
                },
                child: Column(
                  children: [
                    // Indicador circular con icono
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: _completado[index] ? Colors.green : Colors.grey.shade300,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        iconos[index],
                        color: _completado[index] ? Colors.white : Colors.black54,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(comidas[index], style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}