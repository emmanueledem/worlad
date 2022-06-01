import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  bool? alreadyVisited;

  Future<void> changeStatus() async {
    alreadyVisited = true;
    notifyListeners();
    await setVisitingFlag();
  }

  Future setVisitingFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('alreadyvisited', alreadyVisited!);
  }

  Future getVisitingFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    alreadyVisited = prefs.getBool('alreadyvisited') ?? false;
    return alreadyVisited;
  }
}
