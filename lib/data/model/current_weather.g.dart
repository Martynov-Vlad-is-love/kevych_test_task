// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      time: json['time'] as String,
      interval: (json['interval'] as num).toInt(),
      relativeHumidity2m: (json['relative_humidity_2m'] as num).toInt(),
      temperature2m: (json['temperature_2m'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'time': instance.time,
      'interval': instance.interval,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'temperature_2m': instance.temperature2m,
    };
