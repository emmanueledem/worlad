// v2/top-headlines?category=business&apiKey=b7b34907627643a3a46aef6920305176

import 'package:logger/logger.dart';
import 'package:worlad/core/errors/error.dart';
import 'package:worlad/features/news/data/model/news_model.dart';
import 'package:worlad/features/news/data/news_api_requester.dart';

abstract class NewsService {
  Future<void> bussinessNews();
  Future<void> entertainmentNews();
  Future<void> healthNews();
  Future<void> scienceNews();
  Future<void> sportNews();
  Future<void> technologyNews();
}

class NewsServiceImplementation implements NewsService {
  final NewsApiServiceRequester _apiServiceRequester =
      NewsApiServiceRequester();
  NewsModel? _bussinessNewsData;
  NewsModel? get bussinesNewsData => _bussinessNewsData;

  NewsModel? _entertainmentNewsData;
  NewsModel? get entertainmentNewsData => _entertainmentNewsData;

  NewsModel? _healthNewsData;
  NewsModel? get healthNewsData => _healthNewsData;

  NewsModel? _scienceNewsData;
  NewsModel? get scienceNewsData => _scienceNewsData;

  NewsModel? _sportNewsData;
  NewsModel? get sportNewsData => _sportNewsData;

  NewsModel? _technologyNewsData;
  NewsModel? get technologyNewsData => _technologyNewsData;

  bool? _isNotAccessd;
  bool? get isNotAccessd => _isNotAccessd;


    @override
  Future<void> bussinessNews() async {
    try {
      _isNotAccessd = true;
      final response = await _apiServiceRequester.getRequest(
        url: 'v2/top-headlines?category=business&apiKey=',
      );
      _bussinessNewsData = NewsModel.fromJson(response.data);
    } catch (e) {
      Logger().d('$e');
      if (e is NoInternetException) {
        _isNotAccessd = false;
      }
    }
  }

  @override
  Future<void> entertainmentNews() {
    // TODO: implement entertainmentNews
    throw UnimplementedError();
  }

  @override
  Future<void> healthNews() {
    // TODO: implement healthNews
    throw UnimplementedError();
  }

  @override
  Future<void> scienceNews() {
    // TODO: implement scienceNews
    throw UnimplementedError();
  }

  @override
  Future<void> sportNews() {
    // TODO: implement sportNews
    throw UnimplementedError();
  }

  @override
  Future<void> technologyNews() {
    // TODO: implement technologyNews
    throw UnimplementedError();
  }


}
