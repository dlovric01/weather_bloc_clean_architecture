
import '../entities/weather_info.dart';

abstract class WeatherInfoRepository {
  Future<WeatherInfo>? getWeatherInfo(String? cityName);
}