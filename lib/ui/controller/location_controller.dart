import 'package:flutter/material.dart';
import 'package:location/location.dart';

enum LoadState { loading, loaded, error }

class LocationController extends ChangeNotifier {
  final Location _location = Location();

  LoadState _state = LoadState.loading;
  String? _error;
  LocationData? _locationData;
  bool _serviceEnabled = false;
  PermissionStatus? _permissionStatus;

  LoadState get state => _state;
  String? get error => _error;
  LocationData? get locationData => _locationData;
  bool get serviceEnabled => _serviceEnabled;
  PermissionStatus? get permissionStatus => _permissionStatus;

  Future<void> requestLocation() async {
    _setState(LoadState.loading);

    try {
      _serviceEnabled = await _location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _location.requestService();
        if (!_serviceEnabled) {
          _fail("Геолокація вимкнута");
          return;
        }
      }

      _permissionStatus = await _location.hasPermission();

      if (_permissionStatus == PermissionStatus.denied) {
        _permissionStatus = await _location.requestPermission();
      }

      if (_permissionStatus != PermissionStatus.granted) {
        _fail("Дозвіл на отримання геолокації не відхилено");
        return;
      }

      _locationData = await _location.getLocation();

      if (_locationData == null) {
        _fail("Не вдалося отримати геолокацію");
        return;
      }

      _setState(LoadState.loaded);
    } catch (e) {
      _fail(e.toString());
    }
  }

  Future<void> retry() async {
    await requestLocation();
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