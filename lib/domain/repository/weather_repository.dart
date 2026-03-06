import 'package:kevych_test_task/domain/entity/weather.dart';

abstract class WeatherRepository<T> {
  Future<Weather?> getByName(String city);
  Future<Weather> getByCoord(String lat, String lon);
}