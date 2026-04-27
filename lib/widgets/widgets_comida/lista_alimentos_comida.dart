import 'package:flutter/material.dart';
import 'package:app_pvvc/modelos/alimento.dart';

class ListaAlimentosComida extends StatelessWidget {
  final List<Alimento> alimentos;
  final String nombreCategoria;
  final bool Function(Alimento alimento) puedeAgregarAlimento;
  final void Function(Alimento alimento) alAgregarAlimento;
  final VoidCallback alIniciarArrastre;
  final Widget Function({
    required String ruta,
    double? ancho,
    double? alto,
    BoxFit ajuste,
  })
  construirAssetSeguro;

  const ListaAlimentosComida({
    super.key,
    required this.alimentos,
    required this.nombreCategoria,
    required this.puedeAgregarAlimento,
    required this.alAgregarAlimento,
    required this.alIniciarArrastre,
    required this.construirAssetSeguro,
  });

  Widget _buildTarjetaAlimentoPanel(Alimento alimento, bool puedeAgregar) {
    return Opacity(
      opacity: puedeAgregar ? 1 : 0.55,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: puedeAgregar ? Colors.grey.shade300 : Colors.red.shade200,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: construirAssetSeguro(
                ruta: alimento.imagen,
                ancho: 54,
                alto: 54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              alimento.nombre,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Icon(
              puedeAgregar ? Icons.add_circle : Icons.block,
              color: puedeAgregar ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final alimentosFiltrados = alimentos
        .where((alimento) => alimento.categoria == nombreCategoria)
        .toList();

    if (alimentosFiltrados.isEmpty) {
      return const Center(
        child: Text(
          'No hay alimentos en esta categoría',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      );
    }

    return GridView.builder(
      itemCount: alimentosFiltrados.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.92,
      ),
      itemBuilder: (context, index) {
        final alimento = alimentosFiltrados[index];
        final puedeAgregar = puedeAgregarAlimento(alimento);
        return LongPressDraggable<Alimento>(
          data: alimento,
          rootOverlay: true,
          delay: const Duration(milliseconds: 220),
          dragAnchorStrategy: pointerDragAnchorStrategy,
          onDragStarted: alIniciarArrastre,
          feedback: Builder(
            builder: (context) {
              final size = MediaQuery.of(context).size;
              final shortestSide = size.shortestSide;
              final double tamanoArrastre = (shortestSide * 0.16).clamp(85.0, 125.0);
              

              return Material(
                color: Colors.transparent,
                child: SizedBox(
                  width: tamanoArrastre,
                  height: tamanoArrastre,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: tamanoArrastre * 0.08,
                        child: Container(
                          width: tamanoArrastre * 0.62,
                          height: tamanoArrastre * 0.22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, 
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 12,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      construirAssetSeguro(
                        ruta: alimento.imagen,
                        ancho: tamanoArrastre * 0.88,
                        alto: tamanoArrastre * 0.88,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          childWhenDragging: Opacity(
            opacity: 0.002,
            child: _buildTarjetaAlimentoPanel(alimento, puedeAgregar),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => alAgregarAlimento(alimento),
            child: _buildTarjetaAlimentoPanel(alimento, puedeAgregar),
          ),
        );
      },
    );
  }
}
