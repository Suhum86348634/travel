import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../services/rick_service.dart';

class DiscoverProvider extends ChangeNotifier {
  final RickService _rickService = RickService();

  String _selectedFilter = "Popular";
  List<Trip> _horizontalTrips = [];
  List<Trip> _verticalTrips = [];

  String get selectedFilter => _selectedFilter;
  List<Trip> get horizontalTrips => _horizontalTrips;
  List<Trip> get verticalTrips => _verticalTrips;

  DiscoverProvider() {
    init(); // 👈 автозагрузка
  }

  Future<void> init() async {
    await loadHorizontalTrips();
    setFilter(_selectedFilter);
  }

  void setFilter(String filter) {
    _selectedFilter = filter;
    _loadVerticalTrips();
    notifyListeners();
  }

  Future<void> loadHorizontalTrips() async {
    _horizontalTrips = [
      Trip(
        title: "Northern Mountain",
        location: "Canada",
        rating: 4.5,
        imageUrl: await _rickService.getRandomImage(),
      ),
      Trip(
        title: "Greenough, Montana",
        location: "USA",
        rating: 4.5,
        imageUrl: await _rickService.getRandomImage(),
      ),
      Trip(
        title: "Mount Fuji",
        location: "Japan",
        rating: 4.9,
        imageUrl: await _rickService.getRandomImage(),
      ),
    ];
    notifyListeners();
  }

  Future<void> _loadVerticalTrips() async {
    _verticalTrips = List.generate(
      5,
      (i) => Trip(
        title: "$_selectedFilter Trip $i",
        location: _selectedFilter,
        rating: 4.0 + i * 0.1,
        imageUrl:
            "https://rickandmortyapi.com/api/character/avatar/${i + 1}.jpeg",
      ),
    );
  }
}