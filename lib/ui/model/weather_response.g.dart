// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      name: json['name'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationTimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: (json['utc_offset_seconds'] as num).toInt(),
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      currentUnits: CurrentUnits.fromJson(
        json['current_units'] as Map<String, dynamic>,
      ),
      current: CurrentWeather.fromJson(json['current'] as Map<String, dynamic>),
      dailyUnits: DailyUnits.fromJson(
        json['daily_units'] as Map<String, dynamic>,
      ),
      daily: DailyWeather.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationTimeMs,
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezoneAbbreviation,
      'elevation': instance.elevation,
      'current_units': instance.currentUnits,
      'current': instance.current,
      'daily_units': instance.dailyUnits,
      'daily': instance.daily,
    };
