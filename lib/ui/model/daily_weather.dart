import 'package:json_annotation/json_annotation.dart';

part 'daily_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DailyWeather {
  final List<String> time;
  @JsonKey(name: 'temperature_2m_max')
  final List<double> temperature2mMax;
  @JsonKey(name: 'temperature_2m_min')
  final List<double> temperature2mMin;
  @JsonKey(name: 'relative_humidity_2m_max')
  final List<int> relativeHumidity2mMax;
  @JsonKey(name: 'relative_humidity_2m_min')
  final List<int> relativeHumidity2mMin;
  @JsonKey(name: 'weather_code')
  final List<int> weatherCode;

  DailyWeather({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.relativeHumidity2mMax,
    required this.relativeHumidity2mMin,
    required this.weatherCode,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherToJson(this);
}
