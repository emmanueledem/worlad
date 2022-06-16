import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:worlad/app/view_models/base_view_model.dart';
import 'package:worlad/app/widgets/flush_bar.dart';
import 'package:worlad/features/weather/data/model/local_weather_model.dart';
import '../../../features/weather/presentation/services/weather_service.dart';
import 'package:worlad/features/weather/data/model/weather_model.dart';

class WeatherViewModel extends BaseViewModel {
  final WeatherServiceImplementaion _weatherService =
      WeatherServiceImplementaion();
  WeatherModel? get weatherData => _weatherService.weatherData;
  List get localWeatherData => _weatherService.localWeatherData;
  bool get ifcomplete => _weatherService.ifcomplete;
  bool inAsyncCall = false;

  Future<void> handleWeather({
    required String location,
    required BuildContext context,
  }) async {
    setBusy(true);
    inAsyncCall = true;
    final res = await _weatherService.getLocationData(location);
    res.fold(
        (l) => {
              // FlushBarNotification.showError(
              //     context, 'No Internet Connection Detected', 'Network Error!')
            }, (r) {
      FlushBarNotification.showError(
          context, 'This Location Does Not Exist', 'Opps Sorry!');
    });
    inAsyncCall = false;
    setBusy(false);
  }

  Future<void> localizeData(LocalWeatherModel localWeatherData) async {
    setBusy(true);
    await _weatherService.runLocalization(localWeatherData);
    setBusy(false);
  }

  Future<void> getLocalWeatherData() async {
    setBusy(true);
    await _weatherService.getLocalizedData();
    setBusy(false);
  }

  Future<void> removeLocalData() async {
    setBusy(true);
    await _weatherService.clearHistory();
    setBusy(false);
  }
}
