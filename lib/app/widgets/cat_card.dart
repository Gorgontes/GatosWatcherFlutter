import 'package:flutter/material.dart';
import 'package:flutter_gatos_viewer/app/providers/cat_provider.dart';
import 'package:flutter_gatos_viewer/app/widgets/cat_info.dart';

class CatCard extends StatelessWidget {
  final CatModel catModel;
  const CatCard({
    Key? key,
    required this.catModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      borderOnForeground: true,
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(catModel.name),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => masInfo(context, catModel),
                  icon: const Icon(Icons.more),
                  constraints: const BoxConstraints(minHeight: 20),
                )
              ],
            ),
            Center(
              child: catModel.catImage?.url != null
                  ? FadeInImage(
                      image: NetworkImage(catModel.catImage!.url),
                      placeholder:
                          const AssetImage('assets/images/gato3Blue.gif'),
                    )
                  : const Text('no hay imagen BITCH'),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(catModel.origin),
                Text(catModel.temperament.split(',')[0]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void masInfo(context, CatModel cat) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: CatInfo(catModel: cat),
            ));
  }
}
