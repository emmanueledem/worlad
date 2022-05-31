import 'package:flutter/material.dart';
import 'package:worlad/app/shared/assets.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/core/navigators/navigators.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Appasset.onboardingScreenImage),
                  fit: BoxFit.cover),
            ),
          ),
          const Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Text(
              'Explore Top Happening\'s WorldWide',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30.0,
                  letterSpacing: -0.03,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 122,
            left: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.introScreen);
              },
              child: Container(
                width: 314,
                height: 55,
                decoration: BoxDecoration(
                  color: AppColor.appColour,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xffFFFFFF),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
