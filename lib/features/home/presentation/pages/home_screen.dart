import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/view_models/home/home_view_model.dart';
import 'package:worlad/core/utils/greeting_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _handleNetwork();
  }

  Future _handleNetwork() async {
    await HomeViewModel().checkNewtwork(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: const BoxDecoration(
                        color: AppColor.appColour,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good ' + TimeFmt.greeting(),
                            style: const TextStyle(
                                fontSize: 32,
                                fontFamily: 'Inter',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFFFFF)),
                          ),
                          const Expanded(
                            child: Text(
                              'We\'re happy to have you!, Let\'s get you some live updates.',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'poppins',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(45),
            Text(
              TimeFmt.getCurrentDate(),
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
              ),
            ),
            const Gap(45),
            AnalogClock(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.black),
                    color: Colors.transparent,
                    shape: BoxShape.circle),
                width: 250.0,
                height: 250,
                isLive: true,
                showAllNumbers: true,
                hourHandColor: Colors.black,
                minuteHandColor: Colors.black,
                showSecondHand: true,
                numberColor: Colors.black87,
                showNumbers: true,
                textScaleFactor: 1.4,
                showTicks: true,
                showDigitalClock: true,
                datetime: DateTime.now()),
          ],
        )),
      ),
    );
  }
}
