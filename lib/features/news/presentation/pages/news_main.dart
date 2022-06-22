import 'package:flutter/material.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/widgets/tab_bar_item.dart';
import 'package:worlad/features/news/presentation/pages/bussiness_news.dart';
import 'package:worlad/features/news/presentation/pages/entertainment_news.dart';
import 'package:worlad/features/news/presentation/pages/health_news.dart';
import 'package:worlad/features/news/presentation/pages/science_news.dart';
import 'package:worlad/features/news/presentation/pages/sport_news.dart';
import 'package:worlad/features/news/presentation/pages/technology_news.dart';

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
            BussinesNews(),
            EntertainmentNews(),
            HealthNews(),
            ScienceNews(),
            SportNews(),
            TechNologyNews(),
          ],
        ),
      )),
    );
  }
}
