import 'package:flutter/material.dart';
import '../utils/styles.dart';
import '../theme/app_colors.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  final TextEditingController expedienteController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController tutorController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  void cargarDatos() {
    var box = Hive.box('settings');
    var user = box.get('user');

    if (user != null) {
      expedienteController.text = user['expediente'] ?? '';
      nombreController.text = user['nombre'] ?? '';
      tutorController.text = user['tutor'] ?? '';
      correoController.text = user['correo'] ?? '';
      telefonoController.text = user['telefono'] ?? '';
    }
  }

  Future<void> guardarDatos() async {
    var box = Hive.box('settings');

    await box.put('user', {
      'expediente': expedienteController.text,
      'nombre': nombreController.text,
      'tutor': tutorController.text,
      'correo': correoController.text,
      'telefono': telefonoController.text,
    });
  }

  @override
  void dispose() {
    expedienteController.dispose();
    nombreController.dispose();
    tutorController.dispose();
    correoController.dispose();
    telefonoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 550, // 👈 límite tablet/web
          ),

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [

                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      children: [

                        // 🔹 TÍTULO
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.settings,
                                  color: AppColors.titulo2, size: 20),
                              SizedBox(width: 10),
                              Text(
                                'Configuración',
                                style: AppTextStyles.titulo2,
                              ),
                            ],
                          ),
                        ),

                        const Divider(
                          color: AppColors.titulo2,
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: const [
                            Icon(Icons.person,
                                color: AppColors.titulo2, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Información personal',
                              style: AppTextStyles.titulo3,
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        TextField(
                          controller: expedienteController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Número de expediente',
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          controller: nombreController,
                          decoration: const InputDecoration(
                            labelText: 'Nombre',
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          controller: tutorController,
                          decoration: const InputDecoration(
                            labelText: 'Nombre tutor',
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          controller: correoController,
                          decoration: const InputDecoration(
                            labelText: 'Correo electrónico',
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          controller: telefonoController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Número de teléfono',
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),

                            onPressed: () async {
                              await guardarDatos();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Datos guardados correctamente'),
                                ),
                              );
                            },

                            icon: const Icon(Icons.save),
                            label: const Text(
                              'Guardar datos',
                              style: AppTextStyles.boton,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}