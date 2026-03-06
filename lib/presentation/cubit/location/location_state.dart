import 'package:location/location.dart';

sealed class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final LocationData data;
  LocationLoaded(this.data);
}

class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}
