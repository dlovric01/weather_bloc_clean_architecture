import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_application/features/weather_application/domain/usecases/get_weather_info.dart';

import '../../domain/entities/weather_info.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherInfo? weatherInfo;

  WeatherBloc({required this.weatherInfo}) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetWeatherInfoEvent) {
        if (event.city == 'refreshedCity') {                                // ---- if refresh button is pressed 
          emit(WeatherLoading());
          await Future.delayed(const Duration(milliseconds: 200));
          emit(WeatherInitial());
        } else if (event.city!.isNotEmpty) {                                // ---- If city name is entered
          try {
            emit(WeatherLoading());
            await Future.delayed(const Duration(milliseconds: 400));
            final weather =
                await weatherInfo!.executeGetWeatherInfo(event.city);

            emit(WeatherLoaded(weatherInfo: weather));
          } on DioError catch (e) {                                         // ---- Dio error handling
            if (e.type == DioErrorType.response) {
              emit(const WeatherError(
                  errorMessage: 'Please provide a correct city name.'));
            }
            if (e.type == DioErrorType.connectTimeout) {
              emit(const WeatherError(errorMessage: 'Check your connection'));
            }

            if (e.type == DioErrorType.receiveTimeout) {
              emit(const WeatherError(
                  errorMessage: 'Unable to connect to the server'));
            }

            if (e.type == DioErrorType.other) {
              emit(const WeatherError(errorMessage: 'Something went wrong'));
            }
          }
        } else {                                                           // ---- if there was no input in text field
        
          emit(const WeatherError(errorMessage: 'Please provide a city name'));
          emit(WeatherInitial());
        }
      }
    });
  }
}
