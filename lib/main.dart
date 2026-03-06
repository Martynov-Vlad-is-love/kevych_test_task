import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kevych_test_task/data/datasource/weather_api.dart';
import 'package:kevych_test_task/presentation/cubit/location/location_cubit.dart';
import 'package:kevych_test_task/presentation/cubit/weather/weather_cubit.dart';
import 'package:kevych_test_task/presentation/screen/splash_screen.dart';
import 'package:kevych_test_task/data/repository/weather_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final api = WeatherApi(
    client: http.Client(),
  );

  final repo = WeatherRepositoryImpl(api);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocationCubit()),
        BlocProvider(create: (_) => WeatherCubit(repo)),
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
