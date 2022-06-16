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

  // get request
  Future<Response> getRequest({required String url}) async {
    if (await _connectivityInfo.isConnected) {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.contentType = 'application/json';

      final response = await dio.get(
        baseUrl! + url,
      );
      return response;
    } else {
      throw NoInternetException();
      //  Throw error
    }
  }

  // post request
  Future<Response> postRequest(
      {required String url, required dynamic body}) async {
    if (await _connectivityInfo.isConnected) {
      Logger().d(baseUrl);
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.contentType = 'application/json';

      final response = await dio.post(
        baseUrl! + url,
        data: body,
        options: Options(
          // followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      Logger().d(response);
      return response;
    } else {
      throw NoInternetException();
      //  Throw error
    }
  }

//  put request
  Future<Response> put({
    required String url,
    required dynamic body,
  }) async {
    if (await _connectivityInfo.isConnected) {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.contentType = 'application/json';

      final response = await dio.put(
        baseUrl! + url,
        data: body,
      );

      return response;
    } else {
      throw NoInternetException();
    }
  }
}
