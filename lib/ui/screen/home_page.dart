import 'package:flutter/material.dart';
import 'package:kevych_test_task/enum/load_state.dart';
import 'package:kevych_test_task/ui/controller/location_controller.dart';
import 'package:kevych_test_task/ui/controller/weather_controller.dart';
import 'package:kevych_test_task/ui/widget/error_view.dart';
import 'package:kevych_test_task/ui/widget/gradient_background.dart';
import 'package:kevych_test_task/ui/widget/search_section.dart';
import 'package:kevych_test_task/ui/widget/weather_app_bar.dart';
import 'package:kevych_test_task/ui/widget/weather_content.dart';
import 'package:provider/provider.dart';

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
      final locationController = context.read<LocationController>();
      final weatherController = context.read<WeatherController>();

      await locationController.requestLocation();

      final data = locationController.locationData;
      if (data != null && mounted) {
        await weatherController.getWeatherByCoord(
          data.latitude.toString(),
          data.longitude.toString(),
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
        SizedBox(height: 20),
        const SearchSection(), // ← теперь не пересоздаётся

        Expanded(
          child: Consumer<WeatherController>(
            builder: (_, weatherController, __) {
              switch (weatherController.state) {
                case LoadState.loading:
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );

                case LoadState.error:
                  return ErrorView(message: weatherController.error);

                case LoadState.loaded:
                  return const WeatherContent();
              }
            },
          ),
        ),
      ],
    );
  }
}