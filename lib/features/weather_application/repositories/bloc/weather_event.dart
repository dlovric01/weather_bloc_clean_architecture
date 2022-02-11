part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherInfoEvent extends WeatherEvent {
  final String? city;

  const GetWeatherInfoEvent(this.city);
}