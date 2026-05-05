import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:app_pvvc/modelos/alimento.dart';
import 'package:app_pvvc/modelos/item_platillo.dart';

class TarjetaPlatoBebida extends StatelessWidget {
  final double tamanoPlato;
  final double tamanoZonaBebida;
  final bool esTablet;

  final List<ItemPlatillo> alimentosDelPlatillo;
  final ItemPlatillo? itemBebida;
  final List<ItemPlatillo> platilloActual;

  final int? indiceItemArrastrandose;
  final bool seArrastraFueraDelPlato;
  final bool seArrastraBebidaFuera;

  final Color colorTema;
  final Color colorTemaOscuro;

  final GlobalKey clavePlato;

  final bool Function(Alimento alimento) puedeAgregarAlimento;

  final bool Function({
    required Offset posicion,
    required double tamanoPlato,
    required double tamanoItem,
  })
  estaFueraDelPlato;

  final bool Function({
    required Offset posicion,
    required double anchoZona,
    required double altoZona,
    required double tamanoItem,
  })
  estaFueraDeZonaBebida;

  final Offset Function({required Offset posicionLocal, required double tamano})
  obtenerPosicionRelativaLibre;

  final void Function(Alimento alimento, {Offset? posicionInicial})
  agregarAlimento;

  final void Function(int indiceReal) iniciarArrastreAlimento;

  final void Function({
    required int indice,
    required DragUpdateDetails detalles,
    required double tamanoPlato,
  })
  actualizarPosicionItemPlatilloLibre;

  final void Function(int indiceReal, bool debeEliminarse)
  finalizarArrastreAlimento;

  final VoidCallback cancelarArrastreAlimento;

  final VoidCallback iniciarArrastreBebida;

  final void Function({
    required ItemPlatillo itemBebida,
    required DragUpdateDetails detalles,
    required double anchoZona,
    required double altoZona,
    required double tamanoItem,
  })
  actualizarPosicionBebida;

  final void Function(bool debeEliminarse) finalizarArrastreBebida;

  final VoidCallback cancelarArrastreBebida;

  final Widget Function(Alimento alimento, bool esTablet)
  construirAlimentoEnPlato;

  final Widget Function(Alimento alimento, bool esTablet) construirVisualBebida;

  const TarjetaPlatoBebida({
    super.key,
    required this.tamanoPlato,
    required this.tamanoZonaBebida,
    required this.esTablet,
    required this.alimentosDelPlatillo,
    required this.itemBebida,
    required this.platilloActual,
    required this.indiceItemArrastrandose,
    required this.seArrastraFueraDelPlato,
    required this.seArrastraBebidaFuera,
    required this.colorTema,
    required this.colorTemaOscuro,
    required this.clavePlato,
    required this.puedeAgregarAlimento,
    required this.estaFueraDelPlato,
    required this.estaFueraDeZonaBebida,
    required this.obtenerPosicionRelativaLibre,
    required this.agregarAlimento,
    required this.iniciarArrastreAlimento,
    required this.actualizarPosicionItemPlatilloLibre,
    required this.finalizarArrastreAlimento,
    required this.cancelarArrastreAlimento,
    required this.iniciarArrastreBebida,
    required this.actualizarPosicionBebida,
    required this.finalizarArrastreBebida,
    required this.cancelarArrastreBebida,
    required this.construirAlimentoEnPlato,
    required this.construirVisualBebida,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double anchoDisponible = constraints.maxWidth;
        final double altoDisponible = constraints.maxHeight;

        final bool usarLayoutHorizontal =
            anchoDisponible >= 720 && anchoDisponible > altoDisponible;

        final double tamanoPlatoSeguro = usarLayoutHorizontal
            ? math.min(
                tamanoPlato,
                math.min(altoDisponible * 0.94, anchoDisponible * 0.62),
              )
            : tamanoPlato;

        final double tamanoItemPlato = math.min(
          esTablet ? 180.0 : 120.0,
          tamanoPlatoSeguro * 0.29,
        );

        if (usarLayoutHorizontal) {
          final double anchoZonaBebida = math.min(
            anchoDisponible * 0.28,
            250.0,
          );

          final double altoZonaBebida = math.min(
            altoDisponible * 0.88,
            math.max(210.0, tamanoPlatoSeguro * 0.78),
          );

          final double tamanoItemBebida = math.min(
            esTablet ? 165.0 : 135.0,
            math.min(anchoZonaBebida * 0.78, altoZonaBebida * 0.72),
          );

          return SizedBox.expand(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: anchoZonaBebida,
                  height: altoZonaBebida,
                  child: _buildZonaBebida(
                    anchoZona: anchoZonaBebida,
                    altoZona: altoZonaBebida,
                    tamanoItemBebida: tamanoItemBebida,
                  ),
                ),
                const SizedBox(width: 18),
                SizedBox(
                  width: tamanoPlatoSeguro,
                  height: tamanoPlatoSeguro,
                  child: _buildZonaPlato(
                    tamanoPlatoSeguro: tamanoPlatoSeguro,
                    tamanoItemPlato: tamanoItemPlato,
                  ),
                ),
              ],
            ),
          );
        }

        final double anchoBebidaCentrado = esTablet
            ? math.min(anchoDisponible * 0.78, 500.0)
            : math.min(anchoDisponible * 0.92, 360.0);

        final double tamanoItemBebida = math.min(
          esTablet ? 148.0 : 114.0,
          math.min(tamanoZonaBebida * 0.92, tamanoItemPlato * 1.18),
        );

        return SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: tamanoPlatoSeguro,
                child: Center(
                  child: SizedBox(
                    width: tamanoPlatoSeguro,
                    height: tamanoPlatoSeguro,
                    child: _buildZonaPlato(
                      tamanoPlatoSeguro: tamanoPlatoSeguro,
                      tamanoItemPlato: tamanoItemPlato,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                height: tamanoZonaBebida,
                child: Center(
                  child: SizedBox(
                    width: anchoBebidaCentrado,
                    height: tamanoZonaBebida,
                    child: _buildZonaBebida(
                      anchoZona: anchoBebidaCentrado,
                      altoZona: tamanoZonaBebida,
                      tamanoItemBebida: tamanoItemBebida,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildZonaPlato({
    required double tamanoPlatoSeguro,
    required double tamanoItemPlato,
  }) {
    return DragTarget<Alimento>(
      onWillAcceptWithDetails: (details) {
        final alimento = details.data;
        if (alimento.categoria == 'Bebidas') return false;
        if (platilloActual.length >= 11) return false;
        if (!puedeAgregarAlimento(alimento)) return false;
        return true;
      },
      onAcceptWithDetails: (details) {
        final cajaPlato =
            clavePlato.currentContext?.findRenderObject() as RenderBox?;

        if (cajaPlato == null) return;

        final posicionLocal = cajaPlato.globalToLocal(details.offset);

        final posicionRelativa = obtenerPosicionRelativaLibre(
          posicionLocal: posicionLocal,
          tamano: tamanoPlatoSeguro,
        );

        agregarAlimento(details.data, posicionInicial: posicionRelativa);
      },
      builder: (context, candidateData, rejectedData) {
        final estaEncima = candidateData.isNotEmpty;

        return Stack(
          key: clavePlato,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            if (indiceItemArrastrandose != null && seArrastraFueraDelPlato)
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Container(color: colorTemaOscuro.withOpacity(0.28)),
                ),
              ),

            Container(
              width: tamanoPlatoSeguro,
              height: tamanoPlatoSeguro,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: seArrastraFueraDelPlato
                      ? colorTemaOscuro
                      : estaEncima
                      ? Colors.green
                      : Colors.grey.shade400,
                  width: seArrastraFueraDelPlato || estaEncima ? 3 : 2,
                ),
              ),
            ),

            Container(
              width: tamanoPlatoSeguro - 18,
              height: tamanoPlatoSeguro - 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: seArrastraFueraDelPlato
                    ? colorTemaOscuro.withOpacity(0.28)
                    : Colors.white,
                border: Border.all(
                  color: seArrastraFueraDelPlato
                      ? colorTema
                      : estaEncima
                      ? Colors.green.shade200
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
            ),

            if (indiceItemArrastrandose != null && seArrastraFueraDelPlato)
              const Positioned.fill(
                child: IgnorePointer(
                  child: Center(
                    child: Icon(
                      Icons.delete_forever_outlined,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            if (alimentosDelPlatillo.isEmpty)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    size: esTablet ? 56 : 46,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    estaEncima
                        ? 'Suelta aquí el alimento'
                        : 'Agrega alimentos\nal plato',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: esTablet ? 18 : 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              )
            else
              ...List.generate(alimentosDelPlatillo.length, (index) {
                final item = alimentosDelPlatillo[index];
                final indiceReal = platilloActual.indexOf(item);

                if (indiceReal == -1) {
                  return const SizedBox.shrink();
                }

                final izquierda =
                    (tamanoPlatoSeguro * item.posicion.dx) -
                    (tamanoItemPlato / 2);

                final arriba =
                    (tamanoPlatoSeguro * item.posicion.dy) -
                    (tamanoItemPlato / 2);

                return Positioned(
                  left: izquierda,
                  top: arriba,
                  width: tamanoItemPlato,
                  height: tamanoItemPlato,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onPanStart: (_) {
                      iniciarArrastreAlimento(indiceReal);
                    },
                    onPanUpdate: (details) {
                      actualizarPosicionItemPlatilloLibre(
                        indice: indiceReal,
                        detalles: details,
                        tamanoPlato: tamanoPlatoSeguro,
                      );
                    },
                    onPanEnd: (_) {
                      if (indiceReal < 0 ||
                          indiceReal >= platilloActual.length) {
                        cancelarArrastreAlimento();
                        return;
                      }

                      final itemArrastrado = platilloActual[indiceReal];

                      final debeEliminarse = estaFueraDelPlato(
                        posicion: itemArrastrado.posicion,
                        tamanoPlato: tamanoPlatoSeguro,
                        tamanoItem: tamanoItemPlato,
                      );

                      finalizarArrastreAlimento(indiceReal, debeEliminarse);
                    },
                    onPanCancel: cancelarArrastreAlimento,
                    child: construirAlimentoEnPlato(item.alimento, esTablet),
                  ),
                );
              }),
          ],
        );
      },
    );
  }

  Widget _buildZonaBebida({
    required double anchoZona,
    required double altoZona,
    required double tamanoItemBebida,
  }) {
    return DragTarget<Alimento>(
      onWillAcceptWithDetails: (details) {
        final alimento = details.data;
        if (alimento.categoria != 'Bebidas') return false;
        if (!puedeAgregarAlimento(alimento)) return false;
        return true;
      },
      onAcceptWithDetails: (details) {
        agregarAlimento(details.data, posicionInicial: const Offset(0.5, 0.5));
      },
      builder: (context, candidateData, rejectedData) {
        final estaEncima = candidateData.isNotEmpty;

        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            if (seArrastraBebidaFuera)
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(color: colorTemaOscuro.withOpacity(0.30)),
                ),
              ),

            Container(
              width: anchoZona,
              height: altoZona,
              decoration: BoxDecoration(
                color: estaEncima
                    ? Colors.green.withOpacity(0.08)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: seArrastraBebidaFuera
                      ? colorTemaOscuro
                      : estaEncima
                      ? Colors.green
                      : Colors.transparent,
                  width: seArrastraBebidaFuera || estaEncima ? 2 : 0,
                ),
              ),
            ),

            if (seArrastraBebidaFuera)
              const Positioned.fill(
                child: IgnorePointer(
                  child: Center(
                    child: Icon(
                      Icons.delete_forever_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            if (itemBebida == null)
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.local_drink_outlined,
                      size: esTablet ? 52 : 42,
                      color: colorTemaOscuro,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'Agua / bebida',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w700,
                          fontSize: esTablet ? 16 : 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            else
              Positioned(
                left:
                    (anchoZona * itemBebida!.posicion.dx) -
                    (tamanoItemBebida / 2),
                top:
                    (altoZona * itemBebida!.posicion.dy) -
                    (tamanoItemBebida / 2),
                width: tamanoItemBebida,
                height: tamanoItemBebida,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanStart: (_) {
                    iniciarArrastreBebida();
                  },
                  onPanUpdate: (details) {
                    actualizarPosicionBebida(
                      itemBebida: itemBebida!,
                      detalles: details,
                      anchoZona: anchoZona,
                      altoZona: altoZona,
                      tamanoItem: tamanoItemBebida,
                    );
                  },
                  onPanEnd: (_) {
                    final debeEliminarse = estaFueraDeZonaBebida(
                      posicion: itemBebida!.posicion,
                      anchoZona: anchoZona,
                      altoZona: altoZona,
                      tamanoItem: tamanoItemBebida,
                    );

                    finalizarArrastreBebida(debeEliminarse);
                  },
                  onPanCancel: cancelarArrastreBebida,
                  child: construirVisualBebida(itemBebida!.alimento, esTablet),
                ),
              ),
          ],
        );
      },
    );
  }
}
