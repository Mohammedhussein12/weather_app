import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = 'de135eb5089c4fd8834185759230508';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    final Response response =
        await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    try {
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
