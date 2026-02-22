import 'package:flutter/material.dart';
import 'package:kevych_test_task/ui/widget/weather_card.dart';
import 'package:kevych_test_task/ui/widget/weather_forecast.dart';

class WeatherContent extends StatelessWidget {
  const WeatherContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(height: 20),
          WeatherCard(),
          SizedBox(height: 40),
          WeatherForecast(),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
