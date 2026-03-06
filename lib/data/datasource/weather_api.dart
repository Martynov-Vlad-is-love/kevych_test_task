import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  final http.Client client;

  WeatherApi({required this.client});

  Future<Map<String, dynamic>> fetchWeather(String city) async {

    final res = await client.get(
      Uri.parse(
        'https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1&language=en&format=json',
      ),
    );

    if (res.statusCode != 200) {
      throw Exception('Weather request failed: ${res.body}');
    }
    final decoded = jsonDecode(res.body) as Map<String, dynamic>;

    final results = decoded['results'];
    if (results == null || results is! List || results.isEmpty) {
      return {};
    }
    final first = results.first as Map<String, dynamic>;

    final name = first['name'].toString();
    final lat = first['latitude'].toString();
    final lon = first['longitude'].toString();

    final fetch = await fetchWeatherByCoord(lat, lon);
    fetch['name'] = name;

    return fetch;
  }

  Future<Map<String, dynamic>> fetchWeatherByCoord(
    String lat,
    String lon,
  ) async {
    final res = await client.get(
      Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&daily=temperature_2m_max,temperature_2m_min,relative_humidity_2m_max,relative_humidity_2m_min,weather_code&current=relative_humidity_2m,temperature_2m&timezone=auto&forecast_days=14',
      ),
    );

    if (res.statusCode != 200) {
      throw Exception('Weather request failed: ${res.body}');
    }

    return jsonDecode(res.body);
  }
}
