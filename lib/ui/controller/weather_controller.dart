import 'package:flutter/material.dart';
import 'package:kevych_test_task/ui/repository/weather_repository.dart';
import 'package:kevych_test_task/ui/ui_entity/weather.dart';

class WeatherController extends ChangeNotifier{

  final WeatherRepository _repo;

  WeatherController(this._repo);

  Weather? _weather;
  Weather? get weather => _weather;

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  Future<void> getWeatherByName(String name) async {
    try {
      _loading = true;
      _error = null;
      notifyListeners();

      _weather = await _repo.getByName(name);

    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<void> getWeatherByCoord(String lat, String lon) async {
    try {
      _loading = true;
      _error = null;
      notifyListeners();

      _weather = await _repo.getByCoord(lat, lon);

    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}