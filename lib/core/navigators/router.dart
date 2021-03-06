import 'package:flutter/material.dart';
import 'package:worlad/features/home/presentation/pages/intro_screen.dart';import 'package:worlad/features/news/presentation/pages/view_news.dart';
import 'package:worlad/features/onboarding_screen.dart';
import 'package:worlad/features/regions/presentation/pages/all_cities.dart';
import 'package:worlad/features/regions/presentation/pages/all_countries.dart';
import 'package:worlad/features/regions/presentation/pages/all_states.dart';
import 'package:worlad/features/weather/presentation/pages/weather_history.dart';
import 'package:worlad/features/weather/presentation/pages/weather_result.dart';
import 'package:worlad/features/weather/presentation/pages/weather_search.dart';
import 'navigators.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.introScreen:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const IntroScreen(),
        );

      case Routes.allCountries:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const AllCountries(),
        );

      case Routes.viewNewsPage:
      final args =  settings.arguments as ViewsNewsParam;
        return _getPageRoute(
          routeName: settings.name,
          viewToShow:  ViewNews(
            params: args,
          ),
        );

    

      case Routes.allcitiesPage:
        final args = settings.arguments as AllCitiesPram;
        return _getPageRoute(
          routeName: settings.name,
          viewToShow:  AllCities(
            params:  args,
          ),
        );

      case Routes.allStatesPage:
        final args = settings.arguments as AllStatePram;
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: AllStates(
            params: args,
          ),
        );

      case Routes.weatherSearchPage:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const WeatherSearch(),
        );

      case Routes.weatherResultPage:
        final args = settings.arguments as DisplayWeatherInfo;
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: WeatherResult(
            params: args,
          ),
        );

      case Routes.weatherHistoryPage:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const WeatherHistory(),
        );

      case Routes.onBoardingPage:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const OnboardingScreen(),
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
}

PageRoute _getPageRoute({String? routeName, required Widget viewToShow}) {
  return MaterialPageRoute<dynamic>(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
