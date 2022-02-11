import 'package:flutter/material.dart';

import '../../domain/entities/weather_info.dart';
import 'widgets.dart';
import 'package:bordered_text/bordered_text.dart';

class LoadedStateWidget extends StatelessWidget {
  final WeatherInfo? weatherInfo;
  const LoadedStateWidget({
    Key? key,
    this.weatherInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(cityInfo: weatherInfo),
      Padding(
        padding: const EdgeInsets.only(top:150.0,bottom: 20,right: 20,left: 20),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cityWithTemperature(),
              const TextFieldWidget(),
            ],
          ),
        ),
      ),
    ]);
  }

  Column cityWithTemperature() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BorderedText(
          strokeWidth: 1,
          child: Text(
            weatherInfo!.name.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        BorderedText(
          strokeWidth: 1,
          child: Text((weatherInfo!.main!.temp! - 272.15).toStringAsFixed(0) + '°',
              style: const TextStyle(
                fontSize: 70,
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}
