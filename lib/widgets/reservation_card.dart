import 'package:flutter/material.dart';
import '../models/reservation.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;

  ReservationCard({required this.reservation});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: reservation.destination.name,
        child: Image.network(reservation.destination.imageUrl),
      ),
      title: Text(reservation.destination.name),
      subtitle: Text('From: ${reservation.startDate} To: ${reservation.endDate}'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ReservationDetailsScreen(reservation: reservation),
          ),
        );
      },
    );
  }
}

class ReservationDetailsScreen extends StatelessWidget {
  final Reservation reservation;

  ReservationDetailsScreen({required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(reservation.destination.name)),
      body: Column(
        children: [
          Hero(
            tag: reservation.destination.name,
            child: Image.network(reservation.destination.imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(reservation.destination.description),
          ),
        ],
      ),
    );
  }
}
