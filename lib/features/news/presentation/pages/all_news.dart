import 'package:flutter/material.dart';
import 'package:worlad/app/shared/colors.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.white,
              title: Text(
                'News',
                style: TextStyle(
                    color: Color(0xff0A191E),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'poppins'),
              ),
              pinned: true,
              floating: true,
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: AppColor.appColour,
                tabs: [
                  Tab(
                    child: TabBarItem(
                      heading: 'Bussiness',
                    ),
                  ),
                  Tab(
                    child: TabBarItem(
                      heading: 'Entertainment',
                    ),
                  ),
                  Tab(
                    child: TabBarItem(
                      heading: 'Health',
                    ),
                  ),
                  Tab(
                    child: TabBarItem(
                      heading: 'Science',
                    ),
                  ),
                  Tab(
                    child: TabBarItem(
                      heading: 'Sport',
                    ),
                  ),
                  Tab(
                    child: TabBarItem(
                      heading: 'Technology',
                    ),
                  ),
                ],
              ),
            )
          ];
        },
        body: const TabBarView(
          children: [
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      )),
    );
  }
}

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
