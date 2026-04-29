import 'package:flutter/foundation.dart'; // para compute
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

// Función que se ejecutará en segundo plano
Future<Uint8List> _generatePdfBytes() async {
  final pdf = pw.Document();

  final logo = await rootBundle.load('assets/hic/logoBlanco.png');
  final logoImage = pw.MemoryImage(logo.buffer.asUint8List());

  final box = await Hive.openBox('settings');
  final user = box.get('user') ?? {};

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            width: double.infinity,
            padding: const pw.EdgeInsets.all(10),
            color: PdfColors.black,
            child: pw.Center(child: pw.Image(logoImage, height: 40)),
          ),
          pw.SizedBox(height: 15),
          pw.Divider(),
          pw.SizedBox(height: 10),

          pw.Text('Datos del Usuario', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Text('Expediente: ${user['expediente'] ?? 'N/A'}'),
          pw.Text('Nombre: ${user['nombre'] ?? 'N/A'}'),
          pw.Text('Tutor: ${user['tutor'] ?? 'N/A'}'),
          pw.Text('Correo: ${user['correo'] ?? 'N/A'}'),
          pw.Text('Teléfono: ${user['telefono'] ?? 'N/A'}'),

          pw.SizedBox(height: 20),
          pw.Divider(),
          pw.SizedBox(height: 10),

          pw.Text('Datos adicionales', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 8),
          pw.Text('Aquí puedes agregar más información del expediente...'),
        ],
      ),
    ),
  );

  return pdf.save();
}

Future<void> generarPDF() async {
  try {
    print('🚀 Generando PDF...');

    final bytes = await _generatePdfBytes();

    print('✅ PDF generado (${bytes.length} bytes)');

    await Printing.sharePdf(
      bytes: bytes,
      filename: 'Expediente_${DateTime.now().millisecondsSinceEpoch}.pdf',
    );

  } catch (e) {
    print('❌ Error: $e');
  }
}