import 'dart:convert';

import 'package:andreaproject/data/data_provider/weather_data_provider.dart';
import 'package:andreaproject/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Jakarta';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);
      final data = jsonDecode(weatherData);
      if (data['cod'] != '200') {
        throw 'an unexpected error occured';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
