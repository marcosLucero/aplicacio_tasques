import 'package:aplicacio_tasques/componentes/boto_dialog.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {
  final TextEditingController tecTextTasca;
  final Function()? accioGuardar;
  final Function()? accioCancelar;


  const DialogNovaTasca({
    super.key,
    required this.tecTextTasca,
    required this.accioGuardar,
    required this.accioCancelar,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: tecTextTasca,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                hintText: "Escriu la tasca..." ,
                hintStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.blue,
              )
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotoDialog(
                  textBoto: "Guardar", 
                  accioBoto: accioGuardar
                  ),  //boton guardar
                BotoDialog(
                  textBoto: "Cancelar", 
                  accioBoto: accioCancelar
                  ),  //boton cancelar
              ],
            )
          ],
        ),
      ),
    );
  }
}