import 'package:json_annotation/json_annotation.dart';

part 'daily_units.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DailyUnits {
  final String time;

  @JsonKey(name: 'temperature_2m_max')
  final String temperature2mMax;

  @JsonKey(name: 'temperature_2m_min')
  final String temperature2mMin;

  @JsonKey(name: 'relative_humidity_2m_max')
  final String relativeHumidity2mMax;

  @JsonKey(name: 'relative_humidity_2m_min')
  final String relativeHumidity2mMin;

  DailyUnits({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.relativeHumidity2mMax,
    required this.relativeHumidity2mMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) =>
      _$DailyUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$DailyUnitsToJson(this);
}
