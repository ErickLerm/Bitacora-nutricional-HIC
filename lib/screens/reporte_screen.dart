import 'package:flutter/material.dart';
import 'package:app_pvvc/utils/styles.dart';
import 'package:app_pvvc/theme/app_colors.dart';
import 'package:app_pvvc/servicios/generar_pdf.dart';
import 'package:flutter/foundation.dart';

class ReporteScreen extends StatefulWidget {
  const ReporteScreen({super.key});

  @override
  State<ReporteScreen> createState() => _ReporteScreenState();
}

class _ReporteScreenState extends State<ReporteScreen> {
  DateTime? fechaInicio;
  DateTime? fechaFin;

  // Seleccionar fecha inicio
  Future<void> seleccionarFechaInicio(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fechaInicio ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != fechaInicio) {
      setState(() {
        fechaInicio = picked;
      });
    }
  }

  // Seleccionar fecha fin
  Future<void> seleccionarFechaFin(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fechaFin ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != fechaFin) {
      setState(() {
        fechaFin = picked;
      });
    }
  }

  // Formatear fecha
  String formatearFecha(DateTime? fecha) {
    if (fecha == null) return 'Seleccionar fecha';
    return "${fecha.day}/${fecha.month}/${fecha.year}";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),

            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.article,
                              color: AppColors.titulo2,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Generar Reporte",
                              style: AppTextStyles.titulo2,
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        const Divider(
                          color: AppColors.titulo2,
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                        ),

                        const SizedBox(height: 10),

                        InkWell(
                          onTap: () => seleccionarFechaInicio(context),
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Fecha inicio',
                              border: OutlineInputBorder(),
                            ),
                            child: Text(formatearFecha(fechaInicio)),
                          ),
                        ),

                        const SizedBox(height: 15),

                        InkWell(
                          onTap: () => seleccionarFechaFin(context),
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Fecha fin',
                              border: OutlineInputBorder(),
                            ),
                            child: Text(formatearFecha(fechaFin)),
                          ),
                        ),

                        const SizedBox(height: 25),

if (!kIsWeb) ...[
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),

                            onPressed: () async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Generando reporte...'),
                                ),
                              );

                              if (fechaInicio == null || fechaFin == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Selecciona fecha inicio y fecha fin',
                                    ),
                                  ),
                                );
                                return;
                              }

                              if (fechaFin!.isBefore(fechaInicio!)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'La fecha fin no puede ser antes de la fecha inicio',
                                    ),
                                  ),
                                );
                                return;
                              }

                              await compartirPDF(
                                fechaInicio: fechaInicio!,
                                fechaFin: fechaFin!,
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('PDF listo para compartir'),
                                ),
                              );
                            },

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.picture_as_pdf, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Compartir reporte',
                                  style: AppTextStyles.boton,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),
],

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () async {
                              if (fechaInicio == null || fechaFin == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Selecciona fecha inicio y fecha fin',
                                    ),
                                  ),
                                );
                                return;
                              }

                              if (fechaFin!.isBefore(fechaInicio!)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'La fecha fin no puede ser antes de la fecha inicio',
                                    ),
                                  ),
                                );
                                return;
                              }

                              await verPDF(
                                fechaInicio: fechaInicio!,
                                fechaFin: fechaFin!,
                              );
                            },

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.save, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  kIsWeb ? 'Descargar y Compartir PDF' : 'Descargar PDF',
                                  style: AppTextStyles.boton,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Image.asset(
                  'assets/hic/mascota.png',
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
