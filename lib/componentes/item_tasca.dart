import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTasca extends StatelessWidget {
  final String texTasca;
  final bool valorCheckbox;
  final Function(bool?)? canviavalorChecbox;
  final Function(BuildContext)? esborraTasca;

  const ItemTasca({
    super.key,
    required this.texTasca,
    required this.valorCheckbox,
    required this.canviavalorChecbox,
    required this.esborraTasca,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Slidable( // Slidable. es un widget de un paquete que permite deslizar un widget a la izquierda o a la derecha para mostrar más opciones.
      endActionPane: ActionPane(
        motion: StretchMotion(), 
        children: [
          SlidableAction(
            icon: Icons.delete, foregroundColor: Colors.black,
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            onPressed: esborraTasca, ),
        ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // checkbox
                Checkbox(
                  activeColor: Colors.teal[200],
                  checkColor: Colors.orange[200],
                  side: BorderSide(
                    color: Colors.orange[200]!,
                    width: 2,
                  ),
                  value: valorCheckbox,
                  onChanged: canviavalorChecbox,
                ),
        
                Text(
                  texTasca,
                  style: TextStyle(
                      color: Colors.orange[200],
                      decoration: valorCheckbox
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.orange[200],
                      decorationThickness: 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
