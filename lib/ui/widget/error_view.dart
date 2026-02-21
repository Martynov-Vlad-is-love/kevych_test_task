import 'package:flutter/material.dart';
import 'package:kevych_test_task/ui/controller/location_controller.dart';
import 'package:provider/provider.dart';

class ErrorView extends StatelessWidget {
  final String? message;
  const ErrorView({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LocationController>();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message ?? "Unknown error",
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: controller.retry,
            child: const Text("Retry"),
          )
        ],
      ),
    );
  }
}