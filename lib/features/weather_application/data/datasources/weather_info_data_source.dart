
import 'package:dio/dio.dart';
import 'package:weather_application/features/weather_application/data/models/weather_info_model.dart';

import '../../../../core/errors/exception.dart';

abstract class WeatherInfoDataSource {
  Future<WeatherInfoModel>? getWeatherInfoSource(String? cityName);
}

class WeatherInfoDataSourceImpl implements WeatherInfoDataSource {
  @override
  Future<WeatherInfoModel>? getWeatherInfoSource(String? cityName) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=984c6381dbcb6d0ceb535ea46ac99f43';
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      return WeatherInfoModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
