import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  final String raza;
  final String origen;
  final String imageUrl;
  final String temperament;
  const CatCard({
    Key? key,
    required this.raza,
    required this.origen,
    required this.imageUrl,
    required this.temperament,
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
                Text(raza),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => masInfo(context),
                  icon: const Icon(Icons.more),
                  constraints: const BoxConstraints(minHeight: 20),
                )
              ],
            ),
            Center(
              child: imageUrl != ''
                  ? FadeInImage(
                      image: NetworkImage(imageUrl),
                      placeholder:
                          const AssetImage('assets/images/gato3Blue.gif'),
                    )
                  : const Text('no hay imagen BITCH'),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(origen),
                Text(temperament.split(',')[0]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void masInfo(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("test"),
            ));
  }
}
