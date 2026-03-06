import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevych_test_task/presentation/cubit/location/location_cubit.dart';
import 'package:kevych_test_task/presentation/cubit/location/location_state.dart';
import 'package:kevych_test_task/presentation/cubit/weather/weather_cubit.dart';
import 'package:kevych_test_task/presentation/cubit/weather/weather_state.dart';
import 'package:kevych_test_task/presentation/widget/error_view.dart';
import 'package:kevych_test_task/presentation/widget/gradient_background.dart';
import 'package:kevych_test_task/presentation/widget/search_section.dart';
import 'package:kevych_test_task/presentation/widget/weather_app_bar.dart';
import 'package:kevych_test_task/presentation/widget/weather_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final locationCubit = context.read<LocationCubit>();
      await locationCubit.requestLocation();
      if (!mounted) return;

      final locationState = context.read<LocationCubit>().state;
      if (locationState is LocationLoaded) {
        await context.read<WeatherCubit>().getWeatherByCoord(
          locationState.data.latitude.toString(),
          locationState.data.longitude.toString(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const WeatherAppBar(),
      body: const GradientBackground(
        child: SafeArea(
          child: HomeBody(),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const SearchSection(),
        Expanded(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return switch (state) {
                WeatherInitial() || WeatherLoading() => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
                WeatherError(:final message) => ErrorView(message: message),
                WeatherLoaded() => const WeatherContent(),
              };
            },
          ),
        ),
      ],
    );
  }
}