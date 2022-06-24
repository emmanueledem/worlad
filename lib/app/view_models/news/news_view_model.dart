import 'package:flutter/material.dart';
import 'package:worlad/app/view_models/base_view_model.dart';
import 'package:worlad/app/widgets/flush_bar.dart';
import 'package:worlad/features/news/data/model/news_model.dart';
import 'package:worlad/features/news/presentation/services/news_service.dart';

class NewsVieModel extends BaseViewModel {
  final NewsServiceImplementation _newsService = NewsServiceImplementation();

  NewsModel? get bussinesNewsData => _newsService.bussinesNewsData;

  NewsModel? get entertainmentNewsData => _newsService.entertainmentNewsData;

  NewsModel? get healthNewsData => _newsService.healthNewsData;

  NewsModel? get scienceNewsData => _newsService.scienceNewsData;

  NewsModel? get sportNewsData => _newsService.sportNewsData;

  NewsModel? get technologyNewsData => _newsService.technologyNewsData;

  bool? get isNotAccessd => _newsService.isNotAccessd;

  bool inAsyncCall = false;

  Future<void> handleBussinessNews({required BuildContext context}) async {
    setBusy(true);
    await _newsService.bussinessNews();
    if (isNotAccessd == false) {
      FlushBarNotification.showError(
          context, 'No Internet Connection Detected', 'Network Error!');
    }
    inAsyncCall = false;
    setBusy(false);
  }

  Future<void> handleentertainmentNews({required BuildContext context}) async {
    setBusy(true);
    await _newsService.entertainmentNews();
    if (isNotAccessd == false) {
      FlushBarNotification.showError(
          context, 'No Internet Connection Detected', 'Network Error!');
    }
    inAsyncCall = false;
    setBusy(false);
  }

  Future<void> handlehealthNews({required BuildContext context}) async {
    setBusy(true);
    await _newsService.healthNews();
    if (isNotAccessd == false) {
      FlushBarNotification.showError(
          context, 'No Internet Connection Detected', 'Network Error!');
    }
    inAsyncCall = false;
    setBusy(false);
  }

  Future<void> handlescienceNews({required BuildContext context}) async {
    setBusy(true);
    await _newsService.scienceNews();
    if (isNotAccessd == false) {
      FlushBarNotification.showError(
          context, 'No Internet Connection Detected', 'Network Error!');
    }
    inAsyncCall = false;
    setBusy(false);
  }

  Future<void> handlesportNews({required BuildContext context}) async {
    setBusy(true);
    await _newsService.sportNews();
    if (isNotAccessd == false) {
      FlushBarNotification.showError(
          context, 'No Internet Connection Detected', 'Network Error!');
    }
    inAsyncCall = false;
    setBusy(false);
  }

  Future<void> handletechnologyNews({required BuildContext context}) async {
    setBusy(true);
    await _newsService.technologyNews();
    if (isNotAccessd == false) {
      FlushBarNotification.showError(
          context, 'No Internet Connection Detected', 'Network Error!');
    }
    inAsyncCall = false;
    setBusy(false);
  }
  
}
