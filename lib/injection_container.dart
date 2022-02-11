import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_application/core/platform/network_info.dart';
import 'package:weather_application/features/weather_application/data/datasources/weather_info_data_source.dart';
import 'package:weather_application/features/weather_application/data/repositories/weather_info_repository_impl.dart';
import 'package:weather_application/features/weather_application/domain/repositories/weather_info_repository.dart';
import 'package:weather_application/features/weather_application/domain/usecases/get_weather_info.dart';
import 'package:weather_application/features/weather_application/repositories/bloc/weather_bloc.dart';

GetIt sl = GetIt.instance;

void init() async {
  //Features - Weather Info

  // - Bloc
  sl.registerFactory(() => WeatherBloc(
        weatherInfo: sl(),
      ));

  // - Use Cases
  sl.registerLazySingleton(() => GetWeatherInfo(repository: sl()));

  // - Repository
  sl.registerLazySingleton<WeatherInfoRepository>(
      () => WeatherInfoRepositoryImpl(
            networkInfo: sl(),
            weatherInfoDataSource: sl(),
          ));

  // - Data
 sl.registerLazySingleton<WeatherInfoDataSource>(() => WeatherInfoDataSourceImpl());

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(checker: sl()));

  //External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
