import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:worlad/core/local_storage/database_helper.dart';
import 'package:worlad/features/weather/data/model/local_weather_model.dart';
import 'package:worlad/features/weather/data/model/weather_model.dart';
import 'package:worlad/features/weather/data/weather_api_requester.dart';

late DatabaseHelper dbHelper;

abstract class WeatherService {
  Future getLocationData(String location);
  Future getWeatherInfo(double lon, double lat);
  Future runLocalization(LocalWeatherModel localWeatherData);
  Future getLocalizedData();
}

class WeatherServiceImplementaion implements WeatherService {
  final WeatherApiServiceRequester _apiServiceRequester =
      WeatherApiServiceRequester();

  WeatherModel? _weatherData;
  WeatherModel? get weatherData => _weatherData;

  LocalWeatherModel? _localWeatherData;
  LocalWeatherModel? get LocalWeatherData => _localWeatherData;

  @override
  Future getLocationData(String location) async {
    try {
      final res = await _apiServiceRequester.getRequest(
          url: 'geo/1.0/direct?q=$location&limit=1&appid=');

      var long = res.data[0]["lat"];
      var lati = res.data[0]["lon"];
      final response = await getWeatherInfo(long, lati);
      _weatherData = WeatherModel.fromJson(response.data);
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

  @override
  Future<void> runLocalization(LocalWeatherModel localWeatherData) async {
    dbHelper = DatabaseHelper();
    await dbHelper.initDB();
    try {
      var response = await dbHelper.db.insert(
          tableWeather, localWeatherData.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      Logger().d(response.bitLength);
    } catch (e) {
      Logger().e('$e');
    }
  }

  @override
  Future getLocalizedData() async {
    try {
      dbHelper = DatabaseHelper();
      await dbHelper.initDB();
      final List<Map<String, dynamic>> queryResponse = await dbHelper.db.query(
        tableWeather,
      );
      // _localWeatherData = LocalWeatherModel.fromMap(queryResponse);
    } catch (e) {
      Logger().d('$e');
    }
  }
}
