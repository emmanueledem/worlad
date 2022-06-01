import 'package:flutter/material.dart';
import 'package:worlad/app/shared/assets.dart';

import '../../../../app/shared/shared_styles.dart';

class WeatherResult extends StatefulWidget {
  const WeatherResult({Key? key}) : super(key: key);

  @override
  State<WeatherResult> createState() => _WeatherResultState();
}

class _WeatherResultState extends State<WeatherResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Appasset.weatherBackgroundImage),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 26, left: 14),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '17°C',
                        style: kTempTextStyle,
                      ),
                      Text(
                        '🌧',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Cloudy',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 15.0, top: 240),
                  child: Text(
                    ' You will need a 🌧 in ',
                    style: TextStyle(fontSize: 60, color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 15.0,
                  ),
                  child: Text(
                    'Nigeria',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
