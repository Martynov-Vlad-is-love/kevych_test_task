import 'package:kevych_test_task/data/datasource/weather_api.dart';
import 'package:kevych_test_task/data/model/weather_response.dart';
import 'package:kevych_test_task/domain/entity/weather.dart';
import 'package:kevych_test_task/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository<Weather> {
  final WeatherApi api;

  WeatherRepositoryImpl(this.api);

  @override
  Future<Weather?> getByName(String city) async {
    final json = await api.fetchWeather(city);

    if(json.isEmpty){
      return null;
    }
    final dto = WeatherResponse.fromJson(json);

    return Weather(
      city: dto.name ?? 'Your location',
      temp: dto.current.temperature2m.round(),
      feelsLike: dto.current.temperature2m.round(),
      description: "Humidity ${dto.current.relativeHumidity2m}%",
      icon: 's',
      windSpeed: 0,
      humidity: dto.current.relativeHumidity2m,
      dailyWeather: dto.daily
    );
  }

  @override
  Future<Weather> getByCoord(String lat, String lon) async {
    final json = await api.fetchWeatherByCoord(
      lat,
      lon,
    );

    final dto = WeatherResponse.fromJson(json);

    return Weather(
      city: 'Your location',
      temp: dto.current.temperature2m.round(),
      feelsLike: dto.current.temperature2m.round(),
      description: "Humidity ${dto.current.relativeHumidity2m}%",
      icon: 's',
      windSpeed: 0,
      humidity: dto.current.relativeHumidity2m,
      dailyWeather: dto.daily
    );
  }
}