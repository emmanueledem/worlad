import 'package:flutter/material.dart';
import 'package:worlad/app/shared/colors.dart';

// ignore: must_be_immutable
class AppBusyButton extends StatelessWidget {
  AppBusyButton({
    Key? key,
    required this.butttonText,
    required this.onpressed,
  }) : super(key: key);

  VoidCallback onpressed;
  String butttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: 340,
        height: 55,
        decoration: BoxDecoration(
          color: AppColor.appColour,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            butttonText.toString(),
            style: const TextStyle(
                fontFamily: 'Inter',
                color: Color(0xffFFFFFF),
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
