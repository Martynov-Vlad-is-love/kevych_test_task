import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevych_test_task/extension/weather_extension.dart';
import 'package:kevych_test_task/mapper/weather_icon_mapper.dart';
import 'package:kevych_test_task/presentation/cubit/weather/weather_cubit.dart';
import 'package:kevych_test_task/presentation/cubit/weather/weather_state.dart';
import 'package:kevych_test_task/presentation/widget/dots_indicator.dart';
import 'package:kevych_test_task/presentation/widget/glossy_background.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  final _scrollController = ScrollController();
  int _currentIndex = 0;

  static const double _cardWidthFactor = 0.5;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cardWidth = MediaQuery.of(context).size.width * _cardWidthFactor;
    final index = (_scrollController.offset / cardWidth).round();
    if (index != _currentIndex) {
      setState(() => _currentIndex = index);
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is! WeatherLoaded) return const SizedBox.shrink();

        final dailyWeather = state.weather.dailyWeather;
        final itemCount = dailyWeather.time.length;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                controller: _scrollController,
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  final avgHumidity =
                      (dailyWeather.relativeHumidity2mMax[index] +
                          dailyWeather.relativeHumidity2mMin[index]) /
                          2;
                  final weatherCode = WeatherCodeMapper.fromCode(
                    dailyWeather.weatherCode[index],
                  );

                  return Container(
                    width: MediaQuery.of(context).size.width * _cardWidthFactor,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GlossyBackground(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(weatherCode.icon,
                                size: 40, color: Colors.white),
                            const SizedBox(height: 4),
                            _ForecastText('Date ${dailyWeather.time[index]}'),
                            _ForecastText('Humidity $avgHumidity%'),
                            _ForecastText(
                                'Min ${dailyWeather.temperature2mMin[index]}°C'),
                            _ForecastText(
                                'Max ${dailyWeather.temperature2mMax[index]}°C'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            DotsIndicator(
              count: itemCount,
              currentIndex: _currentIndex,
            ),
          ],
        );
      },
    );
  }
}

class _ForecastText extends StatelessWidget {
  final String text;
  const _ForecastText(this.text);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}