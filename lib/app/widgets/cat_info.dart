import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:flutter_gatos_viewer/app/providers/cat_provider.dart';

class CatInfo extends StatelessWidget {
  final CatModel catModel;
  const CatInfo({Key? key, required this.catModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(catModel.name),
        Center(
          child: catModel.catImage?.url != null
              ? FadeInImage(
                  image: NetworkImage(catModel.catImage!.url),
                  placeholder: const AssetImage('assets/images/gato3Blue.gif'),
                )
              : const Text('no hay imagen'),
        ),
        Container(
          width: 400,
          height: 200,
          child: ListView(
            children: getDetalles(catModel.raw),
          ),
        )
      ]),
    );
  }

  List<Widget> getDetalles(Map<String, dynamic>? cat) {
    if (cat == null) return [];
    return cat.entries.map(
      (MapEntry e) {
        if (e.value is Map) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Section(
                header: "${ReCase(e.key).titleCase} :",
                description: "",
                hasDivider: false,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(children: getDetalles(e.value)),
              ),
            ],
          );
        } else {
          return Section(
            header: e.key,
            description: e.value.toString(),
          );
        }
      },
    ).toList();
  }
}

class Section extends StatelessWidget {
  final String description, header;
  final bool hasDivider;
  const Section({
    Key? key,
    required this.header,
    required this.description,
    this.hasDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                ReCase(header).titleCase,
                // style: const TextStyle(fontSize: ),
              ),
            ),
            if (hasDivider)
              Center(
                child: Container(
                  height: 30,
                  width: 1,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ),
            // const VerticalDivider(
            //   width: 20,
            //   thickness: 10,
            //   indent: 20,
            //   endIndent: 0,
            //   color: Colors.black,
            // ),
            Expanded(
              flex: 3,
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
