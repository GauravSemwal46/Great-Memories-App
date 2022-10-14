import 'package:flutter/material.dart';
import 'package:flutter_places_app/helpers/app_colors.dart';
import 'package:flutter_places_app/helpers/app_routes.dart';
import 'package:flutter_places_app/helpers/constants.dart';
import 'package:flutter_places_app/providers/great_places.dart';
import 'package:flutter_places_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: AppConstants.appName,
        theme: ThemeData(
          primarySwatch: AppColors.indigoColor,
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: AppColors.indigoColor)
                  .copyWith(secondary: AppColors.amberColor),
        ),
        home: const PlacesListScreen(),
        routes: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
