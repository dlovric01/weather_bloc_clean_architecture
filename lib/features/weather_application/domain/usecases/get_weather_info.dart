
import 'package:weather_application/features/weather_application/domain/entities/weather_info.dart';
import 'package:weather_application/features/weather_application/domain/repositories/weather_info_repository.dart';

class GetWeatherInfo {
  final WeatherInfoRepository? repository;

  GetWeatherInfo({required this.repository});

  Future<WeatherInfo?> executeGetWeatherInfo(String? cityName) async {
    return await repository!.getWeatherInfo(cityName);
  }
}
