import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:worlad/app/shared/colors.dart';

class WeatherHistory extends StatefulWidget {
  const WeatherHistory({Key? key}) : super(key: key);

  @override
  State<WeatherHistory> createState() => _WeatherHistoryState();
}

class _WeatherHistoryState extends State<WeatherHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.clear_outlined,
                color: AppColor.appColour,
              ))
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Calabar 🌩',
                          style: TextStyle(
                              color: Color(0xff0A191E),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          '2/July/2022',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.arrow_right_alt_rounded,
                      color: AppColor.appColour,
                    )
                  ],
                ),
                const Gap(10),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Paris 🌩',
                          style: TextStyle(
                              color: Color(0xff0A191E),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'poppins'),
                        ),
                        Text(
                          '2/July/2022',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                    const Icon(Icons.arrow_right_alt_rounded)
                  ],
                ),
                const Gap(10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
