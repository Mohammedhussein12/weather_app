class WeatherModel {
  final String cityName, weatherCondition;
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final double temp;
  final String? image;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.weatherCondition,
      this.image});

  factory WeatherModel.fromJson(json) {
    var forecastData = json['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        maxTemp: forecastData['maxtemp_c'],
        minTemp: forecastData['mintemp_c'],
        temp: forecastData['avgtemp_c'],
        weatherCondition: forecastData['condition']['text'],
        image: forecastData['condition']['icon']);
  }
}
