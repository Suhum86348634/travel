import 'package:flutter/material.dart';
import '../services/rick_service.dart';

class PromoProvider extends ChangeNotifier {
  final RickService _rickService = RickService();
  String? _imageUrl;

  String? get imageUrl => _imageUrl;

  Future<void> loadBackground() async {
    _imageUrl = await _rickService.getRandomImage();
    notifyListeners();
  }
}
