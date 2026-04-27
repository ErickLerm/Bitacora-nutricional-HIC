import 'package:flutter/material.dart';

class PanelLateralComida extends StatelessWidget {
  final bool mostrarPanel;
  final double anchoPanel;
  final String? nombreCategoriaSeleccionada;
  final VoidCallback alCerrarPanel;
  final VoidCallback alRegresarCategorias;
  final Widget listaCategorias;
  final Widget listaAlimentos;

  const PanelLateralComida({
    super.key,
    required this.mostrarPanel,
    required this.anchoPanel,
    required this.nombreCategoriaSeleccionada,
    required this.alCerrarPanel,
    required this.alRegresarCategorias,
    required this.listaCategorias,
    required this.listaAlimentos,
  });

  @override
  Widget build(BuildContext context) {
    final bool estaEnAlimentos = nombreCategoriaSeleccionada != null;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeInOut,
      top: 0,
      bottom: 0,
      right: mostrarPanel ? 0 : -anchoPanel,
      width: anchoPanel,
      child: Material(
        elevation: 18,
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(24)),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(24)),
            ),
            child: Column(
              children: [
                _EncabezadoPanelLateral(
                  estaEnAlimentos: estaEnAlimentos,
                  nombreCategoriaSeleccionada: nombreCategoriaSeleccionada,
                  alCerrarPanel: alCerrarPanel,
                  alRegresarCategorias: alRegresarCategorias,
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: estaEnAlimentos ? listaAlimentos : listaCategorias,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EncabezadoPanelLateral extends StatelessWidget {
  final bool estaEnAlimentos;
  final String? nombreCategoriaSeleccionada;
  final VoidCallback alCerrarPanel;
  final VoidCallback alRegresarCategorias;

  const _EncabezadoPanelLateral({
    required this.estaEnAlimentos,
    required this.nombreCategoriaSeleccionada,
    required this.alCerrarPanel,
    required this.alRegresarCategorias,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        children: [
          IconButton(
            onPressed: estaEnAlimentos ? alRegresarCategorias : alCerrarPanel,
            icon: Icon(
              estaEnAlimentos ? Icons.arrow_back_rounded : Icons.close_rounded,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                estaEnAlimentos ? nombreCategoriaSeleccionada! : 'Categorías',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
