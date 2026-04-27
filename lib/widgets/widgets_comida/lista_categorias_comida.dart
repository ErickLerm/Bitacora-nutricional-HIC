import 'package:flutter/material.dart';
import 'package:app_pvvc/modelos/categoria.dart';

class ListaCategoriasComida extends StatelessWidget {
  final List<Categoria> categorias;
  final int Function(String nombreCategoria) obtenerCantidadCategoria;
  final bool Function(Categoria categoria) categoriaCompleta;
  final Color Function(bool completado) obtenerColorEstado;
  final void Function(String nombreCategoria) alSeleccionarCategoria;
  final Widget Function({
    required String ruta,
    double? ancho,
    double? alto,
    BoxFit ajuste,
  })
  construirAssetSeguro;

  const ListaCategoriasComida({
    super.key,
    required this.categorias,
    required this.obtenerCantidadCategoria,
    required this.categoriaCompleta,
    required this.obtenerColorEstado,
    required this.alSeleccionarCategoria,
    required this.construirAssetSeguro,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categorias.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final categoria = categorias[index];
        final completada = categoriaCompleta(categoria);
        final cantidad = obtenerCantidadCategoria(categoria.nombre);

        return InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () => alSeleccionarCategoria(categoria.nombre),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Container(
                  width: 66,
                  height: 66,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsGeometry.all(8),
                    child: construirAssetSeguro(
                      ruta: categoria.imagen,
                      ancho: 42,
                      alto: 42,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    categoria.nombre,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      completada ? Icons.check_circle : Icons.pending,
                      color: obtenerColorEstado(completada),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$cantidad/${categoria.maximoSeleccion}',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: obtenerColorEstado(completada),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
