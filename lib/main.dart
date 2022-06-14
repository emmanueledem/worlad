import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:worlad/app/view_models/regions/region_view_model.dart';
import 'package:worlad/app/view_models/weather/weather_view_model.dart';
import 'package:worlad/features/home/presentation/services/home_service.dart';
import 'package:worlad/features/splash_screen.dart';
import 'package:worlad/core/navigators/navigators.dart';

bool kReleaseMode = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(create: (context) => WeatherViewModel()),
        ChangeNotifierProvider(create: (context)=> RegionViewModel())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Denote',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: Routers.generateRoute,
          home: const SplashScreen()),
    );
  }
}
