import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class WeatherConditionIcons extends StatelessWidget {
  String? icon;
  String? description;

  WeatherConditionIcons(
      {Key? key, required this.description, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(
              0,
              1,
            ),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: Colors.grey.shade300, width: 1.3, style: BorderStyle.solid),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Text(
              icon.toString(),
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const Gap(20),
            Text(
              description.toString(),
              style: const TextStyle(
                fontFamily: 'Inter',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
