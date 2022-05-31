import 'package:flutter/material.dart';
import 'package:worlad/features/splash_screen.dart';
import 'package:worlad/core/navigators/navigators.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Denote',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Routers.generateRoute,
        home: const SplashScreen());
  }
}
