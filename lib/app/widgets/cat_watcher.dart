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
  @override
  Widget build(BuildContext context) {
    final catProvider = Provider.of<CatProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Cat Viewer")),
      body: Center(
          child: Column(
        children: [
          const Text('Gatos Watcher'),
          const Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                labelText: "Ingresa el raza del gato",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const CatCard(
                  raza: 'g',
                  origen: '',
                  imageUrl: '',
                  temperament: '',
                );
                // return const Text('data');
              },
            ),
          )
        ],
      )),
    );
  }
}
