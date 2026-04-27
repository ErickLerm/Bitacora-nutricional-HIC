import 'package:flutter/material.dart';

enum EstadoVisualComida{
  vacio,
  enProgreso,
  completo,
}


class ControlesSuperioresComida extends StatelessWidget{
  final String diaSeleccionado;
  final String tipoComidaSelecionado;
  final List<String> diasSemana;
  final List<String> tiposComida;
  final EstadoVisualComida Function(String tipoComida) obtenerEstadoComida;
  final void Function(String dia) alCambiarDia;
  final void Function(String tipoComida) alCambiarTipoComida;

  const ControlesSuperioresComida({
    super.key,
    required this.diaSeleccionado,
    required this.tipoComidaSelecionado,
    required this.diasSemana,
    required this.tiposComida,
    required this.obtenerEstadoComida,
    required this.alCambiarDia,
    required this.alCambiarTipoComida,
  });

  Color _colorBordeComidaSelecionada(EstadoVisualComida estado){
    switch(estado){
      case EstadoVisualComida.completo:
        return Colors.green;
      case EstadoVisualComida.enProgreso:
        return  Colors.amber.shade700;
      case EstadoVisualComida.vacio:
        return Colors.blue;
    }
  }


  Color _colorIconoComidaSelecionada(EstadoVisualComida estado){
    switch(estado){
      case EstadoVisualComida.completo:
        return Colors.green;
      case EstadoVisualComida.enProgreso:
        return Colors.amber.shade700;
      case EstadoVisualComida.vacio:
        return Colors.blue;
    }
  }


  Color _colorRellenoComidaSeleccionada(EstadoVisualComida estado){
    switch(estado){
      case EstadoVisualComida.completo:
        return Colors.green.withOpacity(0.14);
      case EstadoVisualComida.enProgreso:
        return Colors.amber.withOpacity(0.18);
      case EstadoVisualComida.vacio:
        return Colors.white;
    }
  }


  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(1),
      
      child: Column(
        children: [
          SizedBox(
            width: 220,
            child: DropdownButtonFormField<String>(
              value: diaSeleccionado,
              decoration: InputDecoration(
                labelText: 'Día',
                prefixIcon: const Icon(Icons.calendar_today_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
              items: diasSemana.map(
                (dia)=> DropdownMenuItem<String>(
                  value: dia,
                  child: Text(dia)),
              ).toList(),
              onChanged: (value){
                if(value == null) return;
                alCambiarDia(value);
              },
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: tiposComida.map(
              (tipoComida){
                final estadoComida = obtenerEstadoComida(tipoComida);
                final bool seleccionado = tipoComidaSelecionado == tipoComida;

                final colorBorde  = seleccionado ? _colorBordeComidaSelecionada(estadoComida) : Colors.grey.shade400;
                final colorRelleno = seleccionado ? _colorRellenoComidaSeleccionada(estadoComida) : Colors.white;
                final colorIcono = seleccionado ? _colorIconoComidaSelecionada(estadoComida) : Colors.grey.shade500;
                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: ()=> alCambiarTipoComida(tipoComida),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: colorRelleno,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: colorBorde,
                        width: 2,
                      ),
                      boxShadow: seleccionado ? [
                        BoxShadow(
                          color: colorBorde.withOpacity(0.10),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ] : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          tipoComida,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        if(seleccionado) ...[
                          const SizedBox( width: 8),
                          Icon(
                            estadoComida == EstadoVisualComida.completo 
                              ? Icons.check_circle 
                              : estadoComida == EstadoVisualComida.enProgreso
                                ? Icons.radio_button_checked
                                :Icons.circle_outlined,
                            size: 18,
                            color: colorIcono,
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }).toList(),
          ),
        ],
      ),
    );
  }  
}