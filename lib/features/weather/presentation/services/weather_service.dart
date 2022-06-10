import 'package:logger/logger.dart';
import 'package:worlad/features/weather/data/weather_api_requester.dart';

abstract class WeatherService {
  Future getLocationData(String location);
  Future getWeatherInfo(double lon, double lat);
}

class WeatherServiceImplementaion implements WeatherService {
  final WeatherApiServiceRequester _apiServiceRequester =
      WeatherApiServiceRequester();

  @override
  Future getLocationData(String location) async {
    try {
      final response = await _apiServiceRequester.getRequest(
          url: 'geo/1.0/direct?q=$location&limit=1&appid=');
      return response;
    } catch (e) {
      Logger().d('$e');
    }
  }

  @override
  Future getWeatherInfo(double lon, double lat) async {
    try {
      final response = await _apiServiceRequester.getRequest(
          url: 'data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=');
      return response;
    } catch (e) {
      Logger().d('$e');
    }
  }
}
