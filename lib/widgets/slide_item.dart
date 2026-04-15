import 'package:app_pvvc/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/imagen_con_efectos.dart';
import '../utils/styles.dart'; 


class SlideItem extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final Color colorFondo;
  final String imagen;
  final String textoLargo;

  const SlideItem({
    super.key,
    required this.titulo,
    required this.descripcion,
    required this.colorFondo,
    required this.imagen,
    required this.textoLargo,
  });

@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          //--------------------TITULO1-----------------------//
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: colorFondo,
              borderRadius: BorderRadius.circular(12), // Bordes redondeados
            ),
            child: Text(
              titulo,
              textAlign: TextAlign.center,
              style: AppTextStyles.titulo1,
            ),
          ),
          
          //--------------------TITULO2-----------------------//
          Text(
            descripcion,
            textAlign: TextAlign.center,
            style: AppTextStyles.titulo2,
          ),
          const SizedBox(height: 10),
          
          //--------------------IMAGEN-----------------------//
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: colorFondo,
              shape: BoxShape.circle,
              //borderRadius: BorderRadius.circular(200), // Bordes redondeados
            ),
            child:
          ImagenCircularTransparente(
            imagen: imagen,
            //size: 400,
          ),),

          const SizedBox(height: 10),

          //--------------------TEXTO-----------------------//
          Container(
            decoration: BoxDecoration(
              color: colorFondo,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            
          
            child: Text(
              textoLargo,
              textAlign: TextAlign.justify,
              style: AppTextStyles.parrafo,
            ),
          ),
        ],
      ),
    ),
  );
}
}

