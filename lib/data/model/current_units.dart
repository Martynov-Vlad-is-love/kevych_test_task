import 'package:json_annotation/json_annotation.dart';

part 'current_units.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentUnits {
  final String time;
  final String interval;

  @JsonKey(name: 'relative_humidity_2m')
  final String relativeHumidity2m;

  @JsonKey(name: 'temperature_2m')
  final String temperature2m;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.relativeHumidity2m,
    required this.temperature2m,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) =>
      _$CurrentUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUnitsToJson(this);
}