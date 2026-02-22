import 'package:flutter/material.dart';
import 'package:kevych_test_task/enum/weather_code.dart';

extension WeatherIcon on WeatherType {
  IconData get icon {
    switch (this) {
      case WeatherType.clear:
        return Icons.wb_sunny;

      case WeatherType.partlyCloudy:
        return Icons.wb_cloudy;

      case WeatherType.cloudy:
        return Icons.cloud;

      case WeatherType.fog:
        return Icons.foggy;

      case WeatherType.drizzle:
        return Icons.grain;

      case WeatherType.rain:
        return Icons.umbrella;

      case WeatherType.snow:
        return Icons.ac_unit;

      case WeatherType.showers:
        return Icons.shower;

      case WeatherType.thunderstorm:
        return Icons.flash_on;

      case WeatherType.unknown:
        return Icons.help_outline;
    }
  }
}