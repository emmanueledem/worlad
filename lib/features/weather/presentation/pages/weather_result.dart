import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:worlad/app/shared/assets.dart';
import 'package:worlad/core/utils/weather_utils.dart';
import '../../../../app/shared/shared_styles.dart';

class WeatherResult extends StatefulWidget {
  const WeatherResult({Key? key, required this.params}) : super(key: key);
  final DisplayWeatherInfo? params;
  @override
  State<WeatherResult> createState() => _WeatherResultState();
}

class _WeatherResultState extends State<WeatherResult> {
  final WeatherUtils _weatherUtils = WeatherUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Appasset.weatherBackgroundImage),
                fit: BoxFit.cover),
          ),
          child: Column(
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
                      children: [
                        Text(
                          widget.params!.temperature.toString() + '°C',
                          style: kTempTextStyle,
                        ),
                        Text(
                          _weatherUtils.getWeatherIcon(widget.params!.id),
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.params!.description.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _weatherUtils.getMessage(widget.params!.temperature) +
                          ' in',
                      style: const TextStyle(fontSize: 60, color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      widget.params!.locationName.toString(),
                      style: const TextStyle(fontSize: 50, color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              const Gap(30)
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayWeatherInfo {
  DisplayWeatherInfo(
      {required this.locationName,
      required this.temperature,
      required this.description,
      required this.id});

  final String? locationName;
  final int? temperature;
  final String? description;
  final int? id;
}
