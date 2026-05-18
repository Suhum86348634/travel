import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../services/rick_service.dart';

class DiscoverProvider extends ChangeNotifier {
  final RickService _rickService = RickService();

  String _selectedFilter = "Popular";
  List<Trip> _horizontalTrips = [];
  List<Trip> _verticalTrips = [];

  bool _isLoading = true;

  String get selectedFilter => _selectedFilter;
  List<Trip> get horizontalTrips => _horizontalTrips;
  List<Trip> get verticalTrips => _verticalTrips;
  bool get isLoading => _isLoading;

  DiscoverProvider() {
    init();
  }

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await loadHorizontalTrips();
    await _loadVerticalTrips();

    _isLoading = false;
    notifyListeners();
  }

  void setFilter(String filter) async {
    _selectedFilter = filter;

    _isLoading = true;
    notifyListeners();

    await _loadVerticalTrips();

    _isLoading = false;
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
  }

  Future<void> _loadVerticalTrips() async {
    await Future.delayed(const Duration(seconds: 1));

    _verticalTrips = List.generate(
      8,
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
