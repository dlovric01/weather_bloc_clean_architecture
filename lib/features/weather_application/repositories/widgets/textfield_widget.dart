import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => _refresh(context),
            icon: const Icon(Icons.refresh),
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          label: const Text('Enter city'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onSubmitted: (cityName) => _submitCity(context, cityName),
      ),
    );
  }
}

void _refresh(BuildContext context) {
  BlocProvider.of<WeatherBloc>(context).add(
    const GetWeatherInfoEvent('refreshedCity'),
  );
}

void _submitCity(BuildContext context, String? cityName) {
  BlocProvider.of<WeatherBloc>(context).add(
    GetWeatherInfoEvent(cityName),
  );
}
