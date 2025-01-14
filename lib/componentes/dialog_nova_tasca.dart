import 'package:aplicacio_tasques/componentes/boto_dialog.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {
  const DialogNovaTasca({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        child: Column(
          children: [
            TextField(),
            Row(
              children: [
                BotoDialog(
                  textBoto: "Guardar", 
                  accioBoto: (){}),  //boton guardar
                BotoDialog(
                  textBoto: "Cancelar", 
                  accioBoto: (){}),  //boton cancelar
              ],
            )
          ],
        ),
      ),
    );
  }
}