import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevych_test_task/data/repository/weather_repository.dart';
import 'package:kevych_test_task/presentation/cubit/weather/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepositoryImpl _repo;

  WeatherCubit(this._repo) : super(WeatherInitial());

  Future<void> getWeatherByName(String name) async {
    if (name.trim().isEmpty) return;

    emit(WeatherLoading());
    try {
      final data = await _repo.getByName(name);
      if (data != null) {
        emit(WeatherLoaded(data));
      } else {
        emit(WeatherError('City not found.'));
      }
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  Future<void> getWeatherByCoord(String lat, String lon) async {
    emit(WeatherLoading());
    try {
      final data = await _repo.getByCoord(lat, lon);
      emit(WeatherLoaded(data));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  Future<void> retry(String lat, String lon) async {
    await getWeatherByCoord(lat, lon);
  }
}
