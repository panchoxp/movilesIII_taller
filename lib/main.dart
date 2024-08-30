import 'package:flutter/material.dart';
import 'models/destination.dart';
import 'models/reservation.dart';
import 'screens/search_tab.dart';
import 'screens/favorites_tab.dart';
import 'screens/reservations_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Destination> destinations = [
    Destination(name: 'Paris', imageUrl: 'https://w7.pngwing.com/pngs/307/274/png-transparent-eiffel-tower-paris-eiffel-tower-arc-de-triomphe-notre-dame-de-paris-seine-eiffel-tower-photography-landscape-natural.png', description: 'The city of lights.'),
    Destination(name: 'New York', imageUrl: 'https://w7.pngwing.com/pngs/604/694/png-transparent-new-york-city-skyline-new-york-computer-wallpaper-silhouette-new-york-thumbnail.png', description: 'The city that never sleeps.'),
  ];

  List<Destination> favorites = [];
  List<Reservation> reservations = [];

  void toggleFavorite(Destination destination) {
    setState(() {
      destination.isFavorite = !destination.isFavorite;
      if (destination.isFavorite) {
        favorites.add(destination);
      } else {
        favorites.remove(destination);
      }
    });
  }

  void removeFavorite(Destination destination) {
    setState(() {
      destination.isFavorite = false;
      favorites.remove(destination);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Travel App'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Search', icon: Icon(Icons.search)),
                Tab(text: 'Favorites', icon: Icon(Icons.favorite)),
                Tab(text: 'Reservations', icon: Icon(Icons.book)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SearchTab(destinations: destinations, onFavorite: toggleFavorite),
              FavoritesTab(favorites: favorites, onRemoveFavorite: removeFavorite),
              ReservationsTab(reservations: reservations),
            ],
          ),
        ),
      ),
    );
  }
}
