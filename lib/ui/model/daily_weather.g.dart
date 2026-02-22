// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) => DailyWeather(
  time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
  temperature2mMax: (json['temperature_2m_max'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  temperature2mMin: (json['temperature_2m_min'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  relativeHumidity2mMax: (json['relative_humidity_2m_max'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  relativeHumidity2mMin: (json['relative_humidity_2m_min'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  weatherCode: (json['weather_code'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$DailyWeatherToJson(DailyWeather instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m_max': instance.temperature2mMax,
      'temperature_2m_min': instance.temperature2mMin,
      'relative_humidity_2m_max': instance.relativeHumidity2mMax,
      'relative_humidity_2m_min': instance.relativeHumidity2mMin,
      'weather_code': instance.weatherCode,
    };
