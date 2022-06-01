import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:worlad/app/shared/assets.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/core/navigators/navigators.dart';

import 'home/presentation/providers/home_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      _hanldeStartup();
    });
    super.initState();
  }

  // void _hanldeStartup() {
  //   var res = Provider.of<HomeProvider>(context, listen: false);
  //   Logger().d(res.getVisitingFlag());
  //   if (res.alreadyVisited == true) {
  //     Navigator.pushReplacementNamed(context, Routes.introScreen);
  //   } else {
  //     Navigator.pushReplacementNamed(context, Routes.onBoardingPage);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColour,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(height: 100, width: 100, image: AssetImage(Appasset.appIcon)),
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

  Future<void> _hanldeStartup() async {
    var res = await Provider.of<HomeProvider>(context, listen: false)
        .getVisitingFlag();
    if (res == true) {
      Navigator.pushReplacementNamed(context, Routes.introScreen);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoardingPage);
    }
  }
}
