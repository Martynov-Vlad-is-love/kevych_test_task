import 'package:json_annotation/json_annotation.dart';

part 'current_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentWeather {
  final String time;
  final int interval;

  @JsonKey(name: 'relative_humidity_2m')
  final int relativeHumidity2m;

  @JsonKey(name: 'temperature_2m')
  final double temperature2m;

  CurrentWeather({
    required this.time,
    required this.interval,
    required this.relativeHumidity2m,
    required this.temperature2m,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}