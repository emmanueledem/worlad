import 'package:logger/logger.dart';
import 'package:worlad/app/view_models/base_view_model.dart';
import '../../../features/weather/presentation/services/weather_service.dart';
import 'package:worlad/features/weather/data/model/weather_model.dart';

class WeatherViewModel extends BaseViewModel {
  final WeatherServiceImplementaion _weatherService =
      WeatherServiceImplementaion();
  WeatherModel? _weatherData;
  WeatherModel? get weatherData => _weatherData;

  bool inAsyncCall = false;

  Future<void> handleWeather({required String location}) async {
    setBusy(true);
    inAsyncCall = true;



    final res = await _weatherService.getLocationData(location);

    var long = res.data[0]["lat"];
    var lati = res.data[0]["lon"];
    final response = await getWeatherData(long, lati);
    Logger().d(response);

    

    _weatherData = WeatherModel.fromJson(response.data);




    inAsyncCall = false;
    setBusy(false);
  }

  Future getWeatherData(double lon, double lat) async {
    final response = _weatherService.getWeatherInfo(lon, lat);
    return response;
  }
}
