import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<WeatherBloc>(
        create: (_) => sl<WeatherBloc>(),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage!),
                duration: const Duration(milliseconds: 2000),
                backgroundColor: Colors.blueGrey,
              ));
            }
          },
          builder: (context, state) {
              if (state is WeatherLoading) {
              return const LoadingStateWidget();
            } else if (state is WeatherLoaded) {
              return LoadedStateWidget(weatherInfo: state.weatherInfo);
            }
            return  const InitialStateWidget();
          },
        ),
      ),
    );
  }
}


