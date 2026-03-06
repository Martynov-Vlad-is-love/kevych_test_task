import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevych_test_task/presentation/cubit/location/location_cubit.dart';
import 'package:kevych_test_task/presentation/cubit/location/location_state.dart';
import 'package:kevych_test_task/presentation/cubit/weather/weather_cubit.dart';

class ErrorView extends StatelessWidget {
  final String? message;
  const ErrorView({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message ?? "Unknown error",
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              final locationState = context.read<LocationCubit>().state;
              if (locationState is LocationLoaded) {
                context.read<WeatherCubit>().retry(
                  locationState.data.latitude.toString(),
                  locationState.data.longitude.toString(),
                );
              }
            },
            child: const Text("Retry"),
          )
        ],
      ),
    );
  }
}