import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_places_app/helpers/db_helper.dart';
import 'package:flutter_places_app/models/places.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place getPlaceById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
            id: item['id'], title: item['title'], image: File(item['image'])))
        .toList();
    notifyListeners();
  }
}
