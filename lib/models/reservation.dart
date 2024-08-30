import 'package:flutter_taller_2/models/destination.dart';

class Reservation {
  final Destination destination;
  final DateTime startDate;
  final DateTime endDate;
  final int adults;
  final int children;

  Reservation({
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.adults,
    required this.children,
  });
}
