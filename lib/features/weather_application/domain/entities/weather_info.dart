import 'package:equatable/equatable.dart';

class WeatherInfo extends Equatable {
  final List<Weather>? weather;
  final Main? main;
  final Sys? sys;
  final String? name;

  const WeatherInfo({
    this.weather,
    this.main,
    this.sys,
    this.name,
  });

  @override
  List<Object> get props => [weather!, main!, sys!, name!];
}

class Main {
  Main({
    required this.temp,
  });

  double? temp;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
      };
}

class Sys {
  Sys({
    required this.country,
  });

  String? country;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
      };
}

class Weather {
  Weather({
    required this.main,
    required this.description,
    required this.icon,
  });

  String? main;
  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
        "description": description,
        "icon": icon,
      };
}
