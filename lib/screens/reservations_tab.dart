import 'package:flutter/material.dart';
import '../models/reservation.dart';
import '../widgets/reservation_card.dart';

class ReservationsTab extends StatelessWidget {
  final List<Reservation> reservations;

  ReservationsTab({required this.reservations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Reservations'),
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return ReservationCard(reservation: reservation);
        },
      ),
    );
  }
}
