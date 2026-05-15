import 'package:flutter/material.dart';
import '../models/trip.dart';

class DetailProvider extends ChangeNotifier {
  Trip? _selectedTrip;
  int _days = 5;

  Trip? get selectedTrip => _selectedTrip;
  int get days => _days;

  void setTrip(Trip trip) {
    _selectedTrip = trip;
    notifyListeners();
  }

  void increaseDays() {
    _days++;
    notifyListeners();
  }

  void decreaseDays() {
    if (_days > 1) {
      _days--;
      notifyListeners();
    }
  }
}
