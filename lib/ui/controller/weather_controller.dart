import 'package:flutter/material.dart';
import 'package:kevych_test_task/enum/load_state.dart';
import 'package:kevych_test_task/ui/repository/weather_repository.dart';
import 'package:kevych_test_task/ui/ui_entity/weather.dart';

class WeatherController extends ChangeNotifier{

  final WeatherRepository _repo;

  WeatherController(this._repo);
  LoadState _state = LoadState.loading;

  Weather? _weather;
  Weather? get weather => _weather;

  LoadState get state => _state;

  String? _error;
  String? get error => _error;

  Future<void> getWeatherByName(String name) async {
    try {
      _error = null;
      _setState(LoadState.loading);

      final data = await _repo.getByName(name);
      if (data != null) {
        _weather = data;
      }

      _setState(LoadState.loaded);
    } catch (e) {
      _fail(e.toString());
    }
  }
  Future<void> getWeatherByCoord(String lat, String lon) async {
    try {
      _setState(LoadState.loading);
      _error = null;
      notifyListeners();

      _weather = await _repo.getByCoord(lat, lon);
      _setState(LoadState.loaded);

    } catch (e) {
      _error = e.toString();
    }
  }

  Future<void> retry(String lat, String lon) async {
    await getWeatherByCoord(lat, lon);
  }

  void _setState(LoadState newState) {
    _state = newState;
    notifyListeners();
  }

  void _fail(String message) {
    _error = message;
    _setState(LoadState.error);
  }
}