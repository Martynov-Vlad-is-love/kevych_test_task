import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevych_test_task/enum/weather_code.dart';
import 'package:kevych_test_task/extension/weather_extension.dart';
import 'package:kevych_test_task/mapper/weather_icon_mapper.dart';
import 'package:kevych_test_task/presentation/cubit/weather/weather_cubit.dart';
import 'package:kevych_test_task/presentation/cubit/weather/weather_state.dart';
import 'package:kevych_test_task/presentation/widget/glossy_background.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is! WeatherLoaded) return const SizedBox.shrink();

        final weather = state.weather;
        final weatherCodes = weather.dailyWeather.weatherCode.isNotEmpty
            ? WeatherCodeMapper.fromCode(weather.dailyWeather.weatherCode[0])
            : WeatherType.unknown;

        return GlossyBackground(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    weather.city,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(weatherCodes.icon, size: 40,color: Colors.white,),
                SizedBox(height: 10),
                Text(
                  '${weather.temp}°C',
                  style: TextStyle(
                    fontSize: 64,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Humidity ${weather.humidity}%',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
