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
    return Column(
      children: [
        Text(raza),
        // Center(child: Image.network(imageUrl)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(origen),
            Text(temperament),
          ],
        ),
      ],
    );
  }
}
