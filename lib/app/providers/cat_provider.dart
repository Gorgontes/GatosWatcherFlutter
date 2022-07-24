import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String urlGatos = 'https://api.thecatapi.com/v1/breeds';

class CatImage {
  final String id;
  final String url;
  final int width;
  final int height;

  CatImage({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CatImage.fromJson(Map<String, dynamic> gato) {
    return CatImage(
      id: gato['id'],
      url: gato['url'],
      width: gato['width'],
      height: gato['height'],
    );
  }
}

class CatModel {
  final String altNames;
  final String name;
  final String origin;
  final String temperament;
  final CatImage? catImage;
  CatModel({
    this.catImage,
    required this.altNames,
    required this.name,
    required this.origin,
    required this.temperament,
  });
  factory CatModel.fromJson(Map<String, dynamic> gato) {
    return CatModel(
      catImage:
          gato.containsKey('image') ? CatImage.fromJson(gato['image']) : null,
      altNames: gato['alt_names'] ?? 'no encontrado',
      name: gato['name'] ?? 'no encontrado',
      origin: gato['origin'] ?? 'no encontrado',
      temperament: gato['temperament'] ?? 'no encontrado',
    );
  }
}

class CatProvider extends ChangeNotifier {
  List<CatModel> _cats = [];
  String searchText = '';
  Iterable<CatModel> get cats =>
      _cats.where((element) => element.name.contains(searchText));
  CatProvider() {
    initCatProvider();
  }
  initCatProvider() {
    http.get(Uri.parse(urlGatos)).then((value) {
      final List<dynamic> res = convert.jsonDecode(value.body);
      _cats = res.map<CatModel>((gato) => CatModel.fromJson(gato)).toList();
      notifyListeners();
    });
  }

  setSeartText(String newText) {
    searchText = newText;
    notifyListeners();
  }
}
