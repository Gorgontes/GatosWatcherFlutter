import 'package:flutter/material.dart';
import 'package:flutter_gatos_viewer/app/providers/cat_provider.dart';

class CatInfo extends StatelessWidget {
  final CatModel catModel;
  const CatInfo({Key? key, required this.catModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(catModel.name),
        Center(
          child: catModel.catImage?.url != null
              ? FadeInImage(
                  image: NetworkImage(catModel.catImage!.url),
                  placeholder: const AssetImage('assets/images/gato3Blue.gif'),
                )
              : const Text('no hay imagen'),
        ),
      ]),
    );
  }
}
