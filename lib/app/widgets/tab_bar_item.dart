import 'package:flutter/material.dart';
import 'package:worlad/app/shared/colors.dart';
class TabBarItem extends StatelessWidget {
  const TabBarItem({Key? key, required this.heading}) : super(key: key);

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'poppins',
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(
          color: AppColor.appColour,
          width: 1,
        ),
      ),
    );
  }
}
