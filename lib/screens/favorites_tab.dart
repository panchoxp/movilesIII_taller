import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/destination_card.dart';

class FavoritesTab extends StatelessWidget {
  final List<Destination> favorites;
  final Function(Destination) onRemoveFavorite;

  FavoritesTab({required this.favorites, required this.onRemoveFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Destinations'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final favorite = favorites[index];
          return Dismissible(
            key: Key(favorite.name),
            onDismissed: (direction) {
              onRemoveFavorite(favorite);
            },
            child: DestinationCard(
              destination: favorite,
              onFavorite: (_) {},
            ),
          );
        },
      ),
    );
  }
}
