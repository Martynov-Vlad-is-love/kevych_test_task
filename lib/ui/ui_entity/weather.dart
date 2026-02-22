import 'package:kevych_test_task/ui/model/daily_weather.dart';

class Weather {
  final String city;
  final int temp;
  final int feelsLike;
  final String description;
  final String icon;
  final double windSpeed;
  final int humidity;
  final DailyWeather dailyWeather;


  Weather({
    required this.city,
    required this.temp,
    required this.feelsLike,
    required this.description,
    required this.icon,
    required this.windSpeed,
    required this.humidity,
    required this.dailyWeather
  });
}