import 'package:worlad/app/view_models/base_view_model.dart';
import 'package:worlad/app/widgets/flush_bar.dart';
import 'package:worlad/features/regions/data/model/regions_model.dart';
import 'package:worlad/features/regions/presentation/services/regions_service.dart';
import 'package:flutter/material.dart';

class RegionViewModel extends BaseViewModel {
  final RegionServiceImplementation _regionService =
      RegionServiceImplementation();

  RegionModel? get countryData => _regionService.countryData;
  StateModel? get stateData => _regionService.stateData;
  CitiesModel? get citiesData => _regionService.citiesData;
  bool? get isNotAccessd => _regionService.isNotAccessd;

  bool inAsyncCall = false;

  Future<void> handlecountry({required BuildContext context}) async {
    setBusy(true);
    await _regionService.allCountries();
    if (isNotAccessd == false) {
      FlushBarNotification.showError(
          context, 'No Internet Connection Detected', 'Network Error!');
    }
    inAsyncCall = false;
    setBusy(false);
  }

  Future<void> handlestates(
      {required BuildContext context, required countryname}) async {
    setBusy(true);
    inAsyncCall = true;
    await _regionService.allStates(countryName: countryname);
    if (isNotAccessd == false) {
      FlushBarNotification.showError(
          context, 'No Internet Connection Detected', 'Network Error!');
    }
    inAsyncCall = false;
    setBusy(false);
  }

    Future<void> handleCities(
      {required BuildContext context, required countryname, required  statename}) async {
    setBusy(true);
    inAsyncCall = true;
    await _regionService.allCities(countryName: countryname, stateName: statename);
    if (isNotAccessd == false) {
      FlushBarNotification.showError(
          context, 'No Internet Connection Detected', 'Network Error!');
    }
    inAsyncCall = false;
    setBusy(false);
  }

}
