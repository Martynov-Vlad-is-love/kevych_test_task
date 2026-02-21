import 'package:flutter/material.dart';
import 'package:kevych_test_task/ui/controller/location_controller.dart';
import 'package:kevych_test_task/ui/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> LocationController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const SplashScreen());
  }
}
