// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_units.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUnits _$CurrentUnitsFromJson(Map<String, dynamic> json) => CurrentUnits(
  time: json['time'] as String,
  interval: json['interval'] as String,
  relativeHumidity2m: json['relative_humidity_2m'] as String,
  temperature2m: json['temperature_2m'] as String,
);

Map<String, dynamic> _$CurrentUnitsToJson(CurrentUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'interval': instance.interval,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'temperature_2m': instance.temperature2m,
    };
