import 'package:flutter/material.dart';
import 'package:flutter_places_app/helpers/app_colors.dart';
import 'package:flutter_places_app/providers/great_places.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String?;
    final place =
        Provider.of<GreatPlaces>(context, listen: false).getPlaceById(id ?? '');
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.greyColor),
        ),
        child: Image.file(
          place.image,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
