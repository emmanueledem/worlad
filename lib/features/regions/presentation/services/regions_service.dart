import 'package:either_dart/either.dart';
import 'package:logger/logger.dart';
import 'package:worlad/core/local_storage/database_helper.dart';
import 'package:worlad/features/regions/data/model/regions_model.dart';
import 'package:worlad/features/regions/data/model/states_model.dart';
import 'package:worlad/features/regions/data/region_api_requester.dart';
import 'package:worlad/core/errors/exceptions/faliure.dart';
import 'package:worlad/core/errors/exceptions/nointernet_exception.dart';

late DatabaseHelper dbHelper;

abstract class RegionService {
  Future<Either<Failure, String>> allCountries();
  Future<Either<Failure, String>> allStates({required String countryName});
}

class RegionServiceImplementation implements RegionService {
  final RegionApiServiceRequester _apiServiceRequester =
      RegionApiServiceRequester();

  RegionModel? _countryData;
  RegionModel? get countryData => _countryData;

  StateModel? _stateData;
  StateModel? get stateData => _stateData;

  @override
  Future<Either<Failure, String>> allCountries() async {
    try {
      final response = await _apiServiceRequester.getRequest(
          url: 'api/v0.1/countries/flag/images');
      _countryData = RegionModel.fromJson(response.data);
    } catch (e) {
      Logger().d('$e');
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
    }
    return Left(UnknownFailure());
  }

  @override
  Future<Either<Failure, String>> allStates(
      {required String countryName}) async {
    try {
      final response = await _apiServiceRequester.postRequest(
        url: 'api/v0.1/countries/states',
        body: {
          "countryName": countryName,
        },
      );
      _stateData = StateModel.fromJson(response.data);
      Logger().d(response.data);
    } catch (e) {
      Logger().d('$e');
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
    }
    return Left(UnknownFailure());
  }
}
