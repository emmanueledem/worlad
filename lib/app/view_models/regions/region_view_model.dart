import 'package:logger/logger.dart';
import 'package:worlad/app/view_models/base_view_model.dart';
import 'package:worlad/app/widgets/flush_bar.dart';
import 'package:worlad/features/regions/data/model/regions_model.dart';
import 'package:worlad/features/regions/data/model/states_model.dart';
import 'package:worlad/features/regions/presentation/services/regions_service.dart';
import 'package:flutter/material.dart';

class RegionViewModel extends BaseViewModel {
  final RegionServiceImplementation _regionService =
      RegionServiceImplementation();

  RegionModel? get countryData => _regionService.countryData;
  StateModel? get stateData => _regionService.stateData;
  bool isNotAccessd = false;
  bool inAsyncCall = false;

  Future<void> handlecountry({required BuildContext context}) async {
    setBusy(true);
    inAsyncCall = true;
    final res = await _regionService.allCountries();
    Logger().d('Helloooooo');
    res.fold(
        (l) => {
              isNotAccessd = true,
              Logger().d(l),
              FlushBarNotification.showError(
                  context, 'No Internet Connection Detected', 'Network Error!')
            }, (r) {
      Logger().d(r);
    });
    inAsyncCall = false;
    setBusy(false);
  }

  Future<void> handlestates(
      {required BuildContext context, required countryName}) async {
    setBusy(true);
    inAsyncCall = true;
    final res = await _regionService.allStates(countryName: countryName);
    res.fold(
        (l) => {
              FlushBarNotification.showError(
                  context, 'No Internet Connection Detected', 'Network Error!')
            },
        (r) {});
    inAsyncCall = false;
    setBusy(false);
  }
}
