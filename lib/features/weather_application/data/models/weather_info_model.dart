import 'package:weather_application/features/weather_application/domain/entities/weather_info.dart';

class WeatherInfoModel extends WeatherInfo {
  const WeatherInfoModel({
    Main? main,
    String? name,
    List<Weather>? weather,
    Sys? sys,
  }) : super(
          main: main,
          name: name,
          weather: weather,
          sys: sys,
        );

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) => WeatherInfoModel(
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        sys: Sys.fromJson(json["sys"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
        "main": main!.toJson(),
        "sys": sys!.toJson(),
        "name": name,
    };
}
