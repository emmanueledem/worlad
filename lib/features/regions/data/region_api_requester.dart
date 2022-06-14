import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worlad/core/errors/error.dart';
import 'package:worlad/core/network/network.dart';

class RegionApiServiceRequester {
  // used for ApI calls

  final dio = Dio();
  final NetworkInfoImpl _connectivityInfo = NetworkInfoImpl();
  String? baseUrl = dotenv.env['REGION_BASE_URL'];
  String? apiKey = dotenv.env['REGION_API_KEY'];

  // get request
  Future<Response> getRequest({required String url}) async {
    if (await _connectivityInfo.isConnected) {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.contentType = 'application/json';

      try {
        final response = await dio
            .get('https://countriesnow.space/api/v0.1/countries/flag/images');
        return response;
      } catch (e) {
        Logger().d('$e');
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
