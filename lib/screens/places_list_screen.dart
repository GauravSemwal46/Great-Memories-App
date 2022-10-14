import 'package:flutter/material.dart';
import 'package:flutter_places_app/helpers/app_routes.dart';
import 'package:flutter_places_app/helpers/constants.dart';
import 'package:flutter_places_app/providers/great_places.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.yourCollection),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.addPlaceRoute),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Consumer<GreatPlaces>(
              child:
                  const Center(child: Text(AppConstants.noCollectionMessage)),
              builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
                  ? ch!
                  : ListView.builder(
                      itemCount: greatPlaces.items.length,
                      itemBuilder: (ctx, i) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  FileImage(greatPlaces.items[i].image),
                            ),
                            title: Text(greatPlaces.items[i].title),
                            onTap: () => Navigator.of(context).pushNamed(
                              AppRoutes.placeDetailRoute,
                              arguments: greatPlaces.items[i].id,
                            ),
                          ),
                          const Divider(thickness: 1),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
