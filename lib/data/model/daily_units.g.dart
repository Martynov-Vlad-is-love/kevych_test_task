// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_units.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyUnits _$DailyUnitsFromJson(Map<String, dynamic> json) => DailyUnits(
  time: json['time'] as String,
  temperature2mMax: json['temperature_2m_max'] as String,
  temperature2mMin: json['temperature_2m_min'] as String,
  relativeHumidity2mMax: json['relative_humidity_2m_max'] as String,
  relativeHumidity2mMin: json['relative_humidity_2m_min'] as String,
);

Map<String, dynamic> _$DailyUnitsToJson(DailyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m_max': instance.temperature2mMax,
      'temperature_2m_min': instance.temperature2mMin,
      'relative_humidity_2m_max': instance.relativeHumidity2mMax,
      'relative_humidity_2m_min': instance.relativeHumidity2mMin,
    };
