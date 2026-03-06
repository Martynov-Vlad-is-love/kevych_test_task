import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevych_test_task/presentation/cubit/location/location_state.dart';
import 'package:location/location.dart';

class LocationCubit extends Cubit<LocationState> {
  final Location _location = Location();

  LocationCubit() : super(LocationInitial());

  Future<void> requestLocation() async {
    emit(LocationLoading());

    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          emit(LocationError('Geolocation disabled.'));
          return;
        }
      }

      PermissionStatus permissionStatus = await _location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await _location.requestPermission();
      }

      if (permissionStatus != PermissionStatus.granted) {
        emit(LocationError('Geolocation permission denied.'));
        return;
      }

      final locationData = await _location.getLocation();
      emit(LocationLoaded(locationData));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  Future<void> retry() async {
    await requestLocation();
  }
}
