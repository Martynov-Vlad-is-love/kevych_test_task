import 'package:flutter/material.dart';
import 'package:kevych_test_task/ui/widget/info_row.dart';
import 'package:kevych_test_task/ui/widget/search_section.dart';
import 'package:kevych_test_task/ui/widget/weather_card.dart';

class WeatherContent extends StatelessWidget {
  const WeatherContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(height: 30),
          SearchSection(),
          SizedBox(height: 20),
          WeatherCard(),
          SizedBox(height: 40),
          InfoRow(),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}