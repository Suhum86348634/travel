import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../services/rick_service.dart';

class TripProvider extends ChangeNotifier {
  final RickService _rickService = RickService();
  List<Trip> _trips = [];

  List<Trip> get trips => _trips;

  Future<void> loadTrips() async {
    final img1 = await _rickService.getRandomImage();
    final img2 = await _rickService.getRandomImage();

    _trips = [
      Trip(title: "Greenough, Montana", location: "USA", rating: 4.5, imageUrl: img1),
      Trip(title: "North Mountain", location: "Canada", rating: 4.5, imageUrl: img2),
    ];

    notifyListeners();
  }
}
