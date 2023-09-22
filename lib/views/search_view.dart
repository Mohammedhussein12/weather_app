import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/main.dart';

import '../models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search A city',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              labelText: 'search',
              labelStyle: TextStyle(
                color: getThemeColor(weatherModel.weatherCondition),
              ),
              hintText: 'Enter City Name',
              suffixIcon: Icon(
                Icons.search,
                color: getThemeColor(weatherModel.weatherCondition),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getThemeColor(weatherModel.weatherCondition),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getThemeColor(weatherModel.weatherCondition),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
