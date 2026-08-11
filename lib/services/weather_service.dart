import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  // Étape 1 : convertit un nom de ville en coordonnées GPS
  Future<Map<String, dynamic>> _getCoordinates(String cityName) async {
    final url = Uri.parse(
      'https://geocoding-api.open-meteo.com/v1/search?name=$cityName&count=1&language=fr',
    );
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la recherche de la ville');
    }

    final data = jsonDecode(response.body);
    if (data['results'] == null || data['results'].isEmpty) {
      throw Exception('Ville introuvable');
    }

    final result = data['results'][0];
    return {
      'name': result['name'],
      'latitude': result['latitude'],
      'longitude': result['longitude'],
    };
  }

  // Étape 2 : récupère la météo à partir des coordonnées
  Future<Weather> getWeatherByCity(String cityName) async {
    final coords = await _getCoordinates(cityName);

    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast'
          '?latitude=${coords['latitude']}'
          '&longitude=${coords['longitude']}'
          '&current=temperature_2m,weather_code,wind_speed_10m',
    );
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la récupération de la météo');
    }

    final data = jsonDecode(response.body);
    final current = data['current'];

    return Weather(
      cityName: coords['name'],
      temperature: current['temperature_2m'].toDouble(),
      weatherCode: current['weather_code'],
      windSpeed: current['wind_speed_10m'].toDouble(),
    );
  }
}