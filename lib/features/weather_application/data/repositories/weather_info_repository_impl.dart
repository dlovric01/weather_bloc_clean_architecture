
import 'package:weather_application/core/platform/network_info.dart';
import 'package:weather_application/features/weather_application/data/datasources/weather_info_data_source.dart';
import 'package:weather_application/features/weather_application/data/models/weather_info_model.dart';

import '../../domain/repositories/weather_info_repository.dart';

class WeatherInfoRepositoryImpl implements WeatherInfoRepository {
  final WeatherInfoDataSource? weatherInfoDataSource;
  final NetworkInfo? networkInfo;

  WeatherInfoRepositoryImpl({
    required this.weatherInfoDataSource,
    required this.networkInfo,
  });
  @override
  Future<WeatherInfoModel>? getWeatherInfo(String? cityName) async {
    if (await networkInfo!.isConnected) {
      final weatherData =
          await weatherInfoDataSource!.getWeatherInfoSource(cityName);
      return weatherData!;
    }
    throw UnimplementedError();
  }
}
