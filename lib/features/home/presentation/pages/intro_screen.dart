import 'package:flutter/material.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/features/home/presentation/pages/home_screen.dart';
import 'package:worlad/features/news/presentation/pages/all_news.dart';
import 'package:worlad/features/regions/presentation/pages/all_countries.dart';
import 'package:worlad/features/weather/presentation/pages/weather_main.dart';
import 'package:provider/provider.dart';
import '../../../../core/errors/network_info.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    WeatherMain(),
    AllCountries(),
    AllNews(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _handleNetwork();
    
  }

  Future _handleNetwork() async {
    var netWorkProvider = Provider.of<NetworkInfoImpl>(context, listen: false);
    await netWorkProvider.checkNewtworkStatus();
    // if(netWorkProvider.networkStatus != true){

    // }
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 24, left: 24),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BottomNavigationBar(
                  unselectedItemColor: const Color(0xffFFFFFF),
                  backgroundColor: AppColor.appColour,
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.black,
                  onTap: _onItemTapped,
                  type: BottomNavigationBarType.fixed,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.sunny),
                      label: 'Weather',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.location_searching),
                      label: 'Region',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.newspaper),
                      label: 'News',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
