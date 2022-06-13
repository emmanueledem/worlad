import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:worlad/core/errors/exceptions/faliure.dart';
import 'package:worlad/core/local_storage/database_helper.dart';
import 'package:worlad/features/weather/data/model/local_weather_model.dart';
import 'package:worlad/features/weather/data/model/weather_model.dart';
import 'package:worlad/features/weather/data/weather_api_requester.dart';
import 'package:either_dart/either.dart';

late DatabaseHelper dbHelper;

abstract class WeatherService {
  Future<Either<Failure, String>> getLocationData(String location);
  Future getWeatherInfo(double lon, double lat);
  Future runLocalization(LocalWeatherModel localWeatherData);
  Future getLocalizedData();
  Future clearHistory();
}

class WeatherServiceImplementaion implements WeatherService {
  final WeatherApiServiceRequester _apiServiceRequester =
      WeatherApiServiceRequester();

  WeatherModel? _weatherData;
  WeatherModel? get weatherData => _weatherData;

  bool _ifcomplete = true;
  bool get ifcomplete => _ifcomplete;

  List _localWeatherData = [];
  List get localWeatherData => _localWeatherData;

  @override
  Future<Either<Failure, String>> getLocationData(String location) async {
    try {
      final res = await _apiServiceRequester.getRequest(
          url: 'geo/1.0/direct?q=$location&limit=1&appid=');
      List resList = res.data;
      if (resList.isNotEmpty) {
        var long = res.data[0]["lat"];
        var lati = res.data[0]["lon"];
        final response = await getWeatherInfo(long, lati);
        _weatherData = WeatherModel.fromJson(response.data);
      } else {
        _weatherData = null;
        return const Right('This Location Does Not Exist');
      }
    } catch (e) {
      Logger().d('$e');
    }
    return Left(UnknownFailure());
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
      await dbHelper.db.insert(tableWeather, localWeatherData.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      Logger().e('$e');
    }
  }

  @override
  Future getLocalizedData() async {
    dbHelper = DatabaseHelper();
    await dbHelper.initDB();
    final List<Map<String, dynamic>> queryResponse = await dbHelper.db.query(
      tableWeather,
      orderBy: "id DESC",
    );
    _localWeatherData = queryResponse;
    _ifcomplete = false;
  }

  @override
  Future<void> clearHistory() async {
    dbHelper = DatabaseHelper();
    await dbHelper.initDB();
    await dbHelper.db.delete(tableWeather);
    await getLocalizedData();
  }
}
