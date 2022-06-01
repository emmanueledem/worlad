import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/widgets/weather_condition_icons.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({Key? key}) : super(key: key);

  @override
  State<WeatherMain> createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Weather Forecast',
          style: TextStyle(
              color: Color(0xff0A191E),
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontFamily: 'poppins'),
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                WeatherConditionIcons(icon: '🌩', description: 'Thundercloud'),
                const Gap(10),
                WeatherConditionIcons(icon: '🌧', description: 'drizzling'),
                const Gap(10),
                WeatherConditionIcons(icon: '☔️', description: 'Raining'),
                const Gap(10),
                WeatherConditionIcons(icon: '☃️', description: 'Snow'),
                const Gap(10),
                WeatherConditionIcons(icon: '🌫', description: 'cloudy'),
                const Gap(10),
                WeatherConditionIcons(icon: '☀️', description: 'Sunny'),
                const Gap(10),
                WeatherConditionIcons(
                    icon: '☁️', description: 'Overcast Clouds'),
                const Gap(40),
                Container(
                  width: 340,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColor.appColour,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Search a Location',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xffFFFFFF),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Gap(20),
                Container(
                  width: 340,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColor.appColour,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Search History',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xffFFFFFF),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Gap(100),
              ],
            ),
          )),
    );
  }
}
