import 'package:aplicacio_tasques/componentes/item_tasca.dart';
import 'package:aplicacio_tasques/data/base_de_dades.dart';
import 'package:flutter/material.dart';
import 'package:aplicacio_tasques/componentes/dialog_nova_tasca.dart';
import 'package:hive/hive.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  /*List tasquesLlista = [
    {"titol": "Tasca 1", "valor": false},
    {"titol": "Tasca 2", "valor": true},
    {"titol": "Tasca 3", "valor": true},
  ];*/

  final Box _boxHive = Hive.box("box_tasques_app");
  BaseDeDades db = BaseDeDades();

  TextEditingController tecTextTasca = TextEditingController();

  void accioGuardar() {
    setState(() {
      db.tasquesLlista.add({
        "titol": tecTextTasca.text,
        "valor": false,
      });
    });
    db.actualitzarDades();
    accioCancelar(); //para llamar a la funcion de cancelar y hacer las dos funciones
  }

  void accioCancelar() {
    tecTextTasca.clear();
    Navigator.of(context).pop();
  }

  void canviaChecbox(bool valorCheckbox, int posLlista) {
    setState(() {
      db.tasquesLlista[posLlista]["valor"] =
          !db.tasquesLlista[posLlista]["valor"];
    });
    db.actualitzarDades();
  }

  void accioEsborrarTasca(int posLlista) {
    setState(() {
      db.tasquesLlista.removeAt(posLlista);
    });
    db.actualitzarDades();
  }

  void crearNovaTasca() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogNovaTasca(
              tecTextTasca: tecTextTasca,
              accioGuardar: accioGuardar,
              accioCancelar: accioCancelar);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],

      // Appbar.
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("App Tasques"),
        foregroundColor: Colors.orange[200],
      ),

      // floatingActionButton.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        shape: const CircleBorder(),
        onPressed: crearNovaTasca,
        child: Icon(
          Icons.add,
          color: Colors.orange[200],
        ),
      ),

      // Body.
      body: ListView.builder(
        itemCount: db.tasquesLlista.length,
        itemBuilder: (context, index) {
          return ItemTasca(
            texTasca: db.tasquesLlista[index]["titol"], //"tasca",
            valorCheckbox: db.tasquesLlista[index]["valor"],
            canviavalorChecbox: (valor) => canviaChecbox(
              db.tasquesLlista[index]["valor"],
              index,
            ),
            esborraTasca: (valor) => accioEsborrarTasca(index),
          );
        },
      ),
    );
  }
}
