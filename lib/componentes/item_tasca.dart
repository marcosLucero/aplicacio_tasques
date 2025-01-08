import 'package:flutter/material.dart';

class ItemTasca extends StatelessWidget {
  final String texTasca;
  final bool valorCheckbox;

  const ItemTasca(
      {super.key, required this.texTasca, required this.valorCheckbox});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                onChanged: (vakorRebut) {},
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
    );
  }
}
