import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kevych_test_task/data/weather_api.dart';
import 'package:kevych_test_task/ui/controller/location_controller.dart';
import 'package:kevych_test_task/ui/controller/weather_controller.dart';
import 'package:kevych_test_task/ui/repository/weather_repository.dart';
import 'package:kevych_test_task/ui/screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final api = WeatherApi(
    client: http.Client(),
  );

  final repo = WeatherRepository(api);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationController()),
        ChangeNotifierProvider(create: (_) => WeatherController(repo)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const SplashScreen(),debugShowCheckedModeBanner: false);
  }
}
