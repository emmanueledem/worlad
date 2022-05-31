import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:worlad/app/shared/assets.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/core/navigators/navigators.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, Routes.onBoardingPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColour,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
                height: 100,
                width: 100,
                image: AssetImage(Appasset.appIcon)),
            Gap(5),
            Text(
              'WORLAD',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
                fontSize: 27,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
