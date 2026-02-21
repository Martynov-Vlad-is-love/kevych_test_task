import 'package:flutter/material.dart';
import 'package:kevych_test_task/ui/controller/location_controller.dart';
import 'package:kevych_test_task/ui/widget/error_view.dart';
import 'package:kevych_test_task/ui/widget/gradient_background.dart';
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
    Future.microtask(() {
      if(mounted){
        context.read<LocationController>().requestLocation();
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
    final controller = context.watch<LocationController>();

    switch (controller.state) {
      case LoadState.loading:
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );

      case LoadState.error:
        return ErrorView(message: controller.error);

      case LoadState.loaded:
        return const WeatherContent();
    }
  }
}