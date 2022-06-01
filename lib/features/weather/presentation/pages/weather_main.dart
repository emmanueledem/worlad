import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:worlad/app/widgets/busy_button.dart';
import 'package:worlad/app/widgets/weather_condition_icons.dart';
import 'package:worlad/core/navigators/custom_page_route.dart';
import 'package:worlad/features/weather/presentation/pages/weather_history.dart';
import 'package:worlad/features/weather/presentation/pages/weather_search.dart';

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
                AppBusyButton(
                  butttonText: 'Search a Location',
                  onpressed: () {
                    Navigator.of(context).push(CustomPageRoute(
                        direction: AxisDirection.up,
                        child: const WeatherSearch()));
                  },
                ),
                const Gap(20),
                AppBusyButton(
                  butttonText: 'Weather History',
                  onpressed: () {
                    Navigator.of(context).push(CustomPageRoute(
                        direction: AxisDirection.up,
                        child: const WeatherHistory()));
                  },
                ),
                const Gap(100),
              ],
            ),
          )),
    );
  }
}
