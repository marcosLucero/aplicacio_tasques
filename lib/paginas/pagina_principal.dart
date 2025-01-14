import 'package:aplicacio_tasques/componentes/item_tasca.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  List tasquesLlista = [
    {"titol": "Tasca 1", "valor": false},
    {"titol": "Tasca 2", "valor": true},
    {"titol": "Tasca 3", "valor": true},
  ];
  void canviaChecbox(bool valorCheckbox, int posLlista){
    setState(() {
      tasquesLlista[posLlista]["valor"] = !tasquesLlista[posLlista]["valor"]; 
    });
  }

  void accioEsborrarTasca(int posLlista){
    setState(() {
      tasquesLlista.removeAt(posLlista);
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
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.orange[200],
        ),
      ),

      // Body.
      body: ListView.builder(
        itemCount: tasquesLlista.length,
        itemBuilder: (context, index) {
          return ItemTasca(
            texTasca: tasquesLlista[index]["titol"],//"tasca", 
            valorCheckbox: tasquesLlista[index]["valor"],
            canviavalorChecbox: (valor) => canviaChecbox(tasquesLlista[index]["valor"], index,),
            esborraTasca: (valor) => accioEsborrarTasca(index),
          );
        },
      ),
    );
  }
}
