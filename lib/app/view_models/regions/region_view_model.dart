
import 'package:worlad/app/view_models/base_view_model.dart';
import 'package:worlad/features/regions/data/model/regions_model.dart';
import 'package:worlad/features/regions/presentation/services/regions_service.dart';

class RegionViewModel extends BaseViewModel {
  final RegionServiceImplementation _regionService =
      RegionServiceImplementation();

  RegionModel? get countryData => _regionService.countryData;

  bool inAsyncCall = false;

  Future<void> handlecountry() async {
    setBusy(true);
    inAsyncCall = true;
    await _regionService.allCountries();
      inAsyncCall = false;
    setBusy(false);
  }
}
