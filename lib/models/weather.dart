class Weather {
  final String cityName;
  final double temperature;
  final int weatherCode;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.weatherCode,
    required this.windSpeed,
  });

  // Traduit le code météo Open-Meteo en description lisible
  String get description {
    if (weatherCode == 0) return 'Ciel dégagé';
    if (weatherCode <= 3) return 'Partiellement nuageux';
    if (weatherCode <= 48) return 'Brouillard';
    if (weatherCode <= 57) return 'Bruine';
    if (weatherCode <= 67) return 'Pluie';
    if (weatherCode <= 77) return 'Neige';
    if (weatherCode <= 82) return 'Averses';
    if (weatherCode <= 99) return 'Orage';
    return 'Inconnu';
  }

  // Emoji correspondant, pour un rendu visuel simple sans images
  String get emoji {
    if (weatherCode == 0) return '☀️';
    if (weatherCode <= 3) return '⛅';
    if (weatherCode <= 48) return '🌫️';
    if (weatherCode <= 67) return '🌧️';
    if (weatherCode <= 77) return '❄️';
    if (weatherCode <= 82) return '🌦️';
    if (weatherCode <= 99) return '⛈️';
    return '❓';
  }
}