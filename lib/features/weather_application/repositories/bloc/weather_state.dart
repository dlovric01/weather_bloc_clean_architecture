part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherInfo? weatherInfo;

  const WeatherLoaded({this.weatherInfo});
}

class WeatherError extends WeatherState {
  final String? errorMessage;

  const WeatherError({this.errorMessage});
}
