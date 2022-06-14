import 'package:logger/logger.dart';
import 'package:worlad/core/local_storage/database_helper.dart';
import 'package:worlad/features/regions/data/model/regions_model.dart';
import 'package:worlad/features/regions/data/region_api_requester.dart';

late DatabaseHelper dbHelper;

abstract class RegionService {
  Future allCountries();
}

class RegionServiceImplementation implements RegionService {
  final RegionApiServiceRequester _apiServiceRequester =
      RegionApiServiceRequester();

  RegionModel? _countryData;
  RegionModel? get countryData => _countryData;

  @override
  Future allCountries() async {
    try {
      final response = await _apiServiceRequester.getRequest(
          url: '?service=countries&method=getcountries');
      _countryData = RegionModel.fromJson(response.data);
    } catch (e) {
      Logger().d('$e');
    }
  }
}
