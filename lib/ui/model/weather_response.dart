import 'package:json_annotation/json_annotation.dart';
import 'package:kevych_test_task/ui/model/current_units.dart';
import 'package:kevych_test_task/ui/model/current_weather.dart';
import 'package:kevych_test_task/ui/model/daily_units.dart';
import 'package:kevych_test_task/ui/model/daily_weather.dart';

part 'weather_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherResponse {
  final String? name;
  final double latitude;
  final double longitude;
  @JsonKey(name: 'generationtime_ms')
  final double generationTimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;

  final CurrentUnits currentUnits;
  final CurrentWeather current;

  final DailyUnits dailyUnits;
  final DailyWeather daily;

  WeatherResponse({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.generationTimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}