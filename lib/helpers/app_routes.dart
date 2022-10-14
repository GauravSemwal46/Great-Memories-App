import 'package:flutter/material.dart';
import 'package:flutter_places_app/screens/add_place_screen.dart';
import 'package:flutter_places_app/screens/place_detail_screen.dart';

class AppRoutes {
  static const addPlaceRoute = '/add-place';
  static const placeDetailRoute = '/place-detail';

  static Map<String, Widget Function(BuildContext)> routes = {
    addPlaceRoute: (_) => const AddPlaceScreen(),
    placeDetailRoute: (_) => const PlaceDetailScreen(),
  };
}
