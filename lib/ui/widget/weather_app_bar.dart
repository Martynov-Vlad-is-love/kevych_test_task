import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withValues(alpha: 0.1),
          centerTitle: true,
          title: const Text(
            "Weather",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}