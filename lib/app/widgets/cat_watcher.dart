import 'package:flutter/material.dart';
import 'package:flutter_gatos_viewer/app/providers/cat_provider.dart';
import 'package:provider/provider.dart';

import 'cat_card.dart';

class CatViewer extends StatefulWidget {
  const CatViewer({Key? key}) : super(key: key);

  @override
  State<CatViewer> createState() => _CatViewerState();
}

class _CatViewerState extends State<CatViewer> {
  List<CatCard> get cartasGatos {
    final catProvider = Provider.of<CatProvider>(context);
    return catProvider.cats.map((gato) => CatCard(catModel: gato)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CatProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("volver")),
      body: Center(
          child: Column(
        children: [
          const Text('Galeria de Gatos'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                labelText: "Ingresa el raza del gato",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              onChanged: (newText) {
                catProvider.setSeartText(newText);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartasGatos.length,
              itemBuilder: (context, index) {
                return cartasGatos[index];
                // return const Text('data');
              },
            ),
          )
        ],
      )),
    );
  }
}
