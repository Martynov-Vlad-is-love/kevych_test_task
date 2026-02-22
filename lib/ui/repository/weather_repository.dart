import 'package:kevych_test_task/data/weather_api.dart';
import 'package:kevych_test_task/ui/model/weather_response.dart';
import 'package:kevych_test_task/ui/repository/repository.dart';
import 'package:kevych_test_task/ui/ui_entity/weather.dart';

class WeatherRepository implements Repository<Weather> {
  final WeatherApi api;

  WeatherRepository(this.api);

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
      windSpeed: 0, // не запитували wind → 0
      humidity: dto.current.relativeHumidity2m,
      dailyWeather: dto.daily
    );
  }

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