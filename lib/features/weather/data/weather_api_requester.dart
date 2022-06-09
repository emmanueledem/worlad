import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worlad/core/errors/error.dart';
import 'package:worlad/core/network/network.dart';

class WeatherApiServiceRequester {
  // used for ApI calls

  final dio = Dio();
  final NetworkInfoImpl _connectivityInfo = NetworkInfoImpl();
  String? baseUrl = dotenv.env['WEATHER_BASE_URL'];

  // get request
  Future<Response> getRequest({required String url}) async {
    if (await _connectivityInfo.isConnected) {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.contentType = 'application/json';

      try {
        final response = await dio.get(
            baseUrl! + url,
        );
        return response;
      } catch (e) {
        throw Exception();
      }
    } else {
      throw NoInternetException();
      //  Throw error
    }
  }

  // post request
  Future<Response> postRequest(
      {required String url, required dynamic body}) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.contentType = 'application/json';

    if (await _connectivityInfo.isConnected) {
      try {
        final response = await dio.post(
          baseUrl! + url,
          data: body,
        );
        return response;
      } catch (e) {
        throw Exception();
      }
    } else {
      throw NoInternetException();
      //  Throw error
    }
  }
}
