import 'dart:ui';

import 'package:flutter/material.dart';

class GlossyBackground extends StatelessWidget {
  const GlossyBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
          ),
          child: child
        )
      ),
    );
  }
}
