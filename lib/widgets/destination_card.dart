import 'package:flutter/material.dart';
import '../models/destination.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final Function(Destination) onFavorite;

  DestinationCard({required this.destination, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(destination.imageUrl),
        title: Text(destination.name),
        subtitle: Text(destination.description),
        trailing: IconButton(
          icon: Icon(
            destination.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: destination.isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            onFavorite(destination);
          },
        ),
      ),
    );
  }
}
