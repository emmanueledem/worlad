import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/view_models/weather/weather_view_model.dart';
import 'package:worlad/app/widgets/alert.dart';
import 'package:worlad/core/navigators/routes.dart';
import 'package:worlad/core/utils/weather_utils.dart';
import 'package:worlad/features/weather/presentation/pages/weather_result.dart';

class WeatherHistory extends StatefulWidget {
  const WeatherHistory({Key? key}) : super(key: key);

  @override
  State<WeatherHistory> createState() => _WeatherHistoryState();
}

class _WeatherHistoryState extends State<WeatherHistory> {
  final WeatherUtils _weatherUtils = WeatherUtils();

  @override
  void initState() {
    _handleWeatherData();
    super.initState();
  }

  Future<void> _handleWeatherData() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<WeatherViewModel>(context, listen: false)
          .getLocalWeatherData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: weatherProvider.localWeatherData.isEmpty
            ? const Text('')
            : PopupMenuButton(
                icon: const Icon(
                  Icons.more_horiz,
                  color: AppColor.appColour,
                ),
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(
                      value: 'deleteAll',
                      child: Text('Clear History'),
                    )
                  ];
                },
                onSelected: (String value) {
                  errorAlertMessage(context, () {
                    weatherProvider.removeLocalData();
                    Navigator.pop(context);
                  });
                },
              ),
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
      body: weatherProvider.ifcomplete == true
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColor.appColour,
            ))
          : weatherProvider.localWeatherData.isEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search,
                            size: 40,
                            color: AppColor.appColour,
                          ),
                          Expanded(
                            child: Text(
                              'once you start a new search you\'ll see it listed here',
                              style: TextStyle(
                                  fontFamily: 'poppins', fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.builder(
                        itemCount: weatherProvider.localWeatherData.length,
                        itemBuilder: (context, index) {
                          final Map item =
                              weatherProvider.localWeatherData[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.weatherResultPage,
                                  arguments: DisplayWeatherInfo(
                                      locationName: item['locationName'],
                                      temperature: item['temperature'].toInt(),
                                      description: item['description'],
                                      id: item['weatherId']),
                                );
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['locationName'] +
                                                _weatherUtils.getWeatherIcon(
                                                    item['weatherId']),
                                            style: const TextStyle(
                                                color: Color(0xff0A191E),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontFamily: 'poppins'),
                                          ),
                                          Text(
                                            item['time'],
                                            style: const TextStyle(
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
                                  const Gap(7),
                                  const Divider(
                                    color: Colors.grey,
                                    height: 1,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
    );
  }
}
