import 'package:dio/dio.dart';

class RickService {
  final Dio _dio = Dio();

  Future<String> getRandomImage() async {
    try {
      final response = await _dio.get("https://rickandmortyapi.com/api/character");
      final results = response.data['results'] as List;
      results.shuffle();
      return results.first['image'];
    } catch (e) {
      throw Exception("Ошибка загрузки Rick&Morty API: $e");
    }
  }
}
