import 'package:logger/logger.dart';
import 'package:worlad/core/local_storage/database_helper.dart';
import 'package:worlad/features/regions/data/model/regions_model.dart';
import 'package:worlad/features/regions/data/region_api_requester.dart';
import 'package:worlad/core/errors/exceptions/nointernet_exception.dart';

late DatabaseHelper dbHelper;

abstract class RegionService {
  Future<void> allCountries();
  Future<void> allStates({required String countryName});
  Future<void> allCities(
      {required String countryName, required String stateName});
  // Future<void> runLocalization(LocalCountryModel localCountryModel);
}

class RegionServiceImplementation implements RegionService {
  final RegionApiServiceRequester _apiServiceRequester =
      RegionApiServiceRequester();

  RegionModel? _countryData;
  RegionModel? get countryData => _countryData;

  StateModel? _stateData;
  StateModel? get stateData => _stateData;

  CitiesModel? _citiesData;
  CitiesModel? get citiesData => _citiesData;

  // _localCountryData

  bool? _isNotAccessd;
  bool? get isNotAccessd => _isNotAccessd;

  @override
  Future<void> allCountries() async {
    // check local db for data

    // make api call
    try {
      _isNotAccessd = true;
      final response = await _apiServiceRequester.getRequest(
          url: 'api/v0.1/countries/flag/images');
      _countryData = RegionModel.fromJson(response.data);

      // for (var item in _countryData!.data!) {
      // Logger().d([
      //   item.flag,
      //   item.name,
      //   item.iso3,
      //   item.iso2,
      // ]);
      // await runLocalization(
      //   LocalCountryModel(countryName: countryName, flag: flag, iso3: iso3),
      // );
      // }
      // save data to local db
    } catch (e) {
      Logger().d('$e');
      if (e is NoInternetException) {
        _isNotAccessd = false;
      }
    }
  }

  @override
  Future<void> allStates({required String countryName}) async {
    try {
      _isNotAccessd = true;
      final response = await _apiServiceRequester.getRequest(
        url: 'api/v0.1/countries/states/q?country=$countryName',
      );
      _stateData = StateModel.fromJson(response.data);
    } catch (e) {
      Logger().d('$e');
      if (e is NoInternetException) {
        _isNotAccessd = false;
      }
    }
  }

  @override
  Future<void> allCities(
      {required String countryName, required String stateName}) async {
   
    try {
      _isNotAccessd = true;
      final response = await _apiServiceRequester.getRequest(
          url:
              'api/v0.1/countries/state/cities/q?country=$countryName&state=$stateName');
      _citiesData = CitiesModel.fromJson(response.data);
    } catch (e) {
      Logger().d('$e');
      if (e is NoInternetException) {
        _isNotAccessd = false;
      }
    }
  }

  // @override
  // Future<void> runLocalization(LocalCountryModel localCountryModel) async {
  //   dbHelper = DatabaseHelper();
  //   await dbHelper.initDB();
  //   try {
  //     await dbHelper.db.insert(tableCountries, localCountryModel.toMap(),
  //         conflictAlgorithm: ConflictAlgorithm.replace);
  //   } catch (e) {
  //     Logger().e('$e');
  //   }
  // }

  // Future<List<Notes>> getNotesAllCountries() async {
  //   dbHelper = DatabaseHelper();
  //   await dbHelper.initDB();
  //   final List<Map<String, dynamic>> queryResponse = await dbHelper.db.query(
  //     tableNotes,
  //     orderBy: "id DESC",
  //   );

  //   availableNote = queryResponse;
  //   ifcomplete = false;

  //   notifyListeners();
  //   return queryResponse.map((e) => Notes.fromMap(e)).toList();
  // }

}
