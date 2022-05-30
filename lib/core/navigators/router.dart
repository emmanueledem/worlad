import 'package:flutter/material.dart';
import 'package:worlad/features/news/presentation/pages/search_news.dart';
import 'package:worlad/features/news/presentation/pages/view_news.dart';
import 'package:worlad/features/regions/presentation/pages/all_cities.dart';
import 'package:worlad/features/weather/presentation/pages/weather_history.dart';
import 'package:worlad/features/weather/presentation/pages/weather_result.dart';
import 'package:worlad/features/weather/presentation/pages/weather_search.dart';
import 'navigators.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.viewNewsPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ViewNews(),
      );

    case Routes.searchNewsPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SearchNews(),
      );
    case Routes.allcitiesPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AllCities(),
      );

    case Routes.allStatesPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AllCities(),
      );

    case Routes.weatherSearchPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const WeatherSearch(),
      );

    case Routes.weatherResultPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const WeatherResult(),
      );

    case Routes.weatherHistoryPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const WeatherHistory(),
      );

    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, required Widget viewToShow}) {
  return MaterialPageRoute<dynamic>(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
