import 'package:kevych_test_task/enum/weather_code.dart';

class WeatherCodeMapper {
  static WeatherType fromCode(int code) {
    switch (code) {
      case 0:
        return WeatherType.clear;

      case 1:
      case 2:
        return WeatherType.partlyCloudy;

      case 3:
        return WeatherType.cloudy;

      case 45:
      case 48:
        return WeatherType.fog;

      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
        return WeatherType.drizzle;

      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
        return WeatherType.rain;

      case 71:
      case 73:
      case 75:
      case 77:
        return WeatherType.snow;

      case 80:
      case 81:
      case 82:
        return WeatherType.showers;

      case 85:
      case 86:
        return WeatherType.snow;

      case 95:
      case 96:
      case 99:
        return WeatherType.thunderstorm;

      default:
        return WeatherType.unknown;
    }
  }
}