import 'package:flutter/material.dart';
import 'package:kevych_test_task/ui/controller/location_controller.dart';
import 'package:kevych_test_task/ui/controller/weather_controller.dart';
import 'package:provider/provider.dart';

class ErrorView extends StatelessWidget {
  final String? message;
  const ErrorView({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final weatherController = context.read<WeatherController>();
    final locationController = context.read<LocationController>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message ?? "Unknown error",
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              final lat = locationController.locationData?.latitude.toString();
              final lon = locationController.locationData?.longitude.toString();
              if(lat != null && lon != null){
                weatherController.retry(lat, lon);

              }
            },
            child: const Text("Retry"),
          )
        ],
      ),
    );
  }
}