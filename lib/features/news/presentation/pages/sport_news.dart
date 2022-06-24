import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/view_models/news/news_view_model.dart';
import 'package:worlad/app/widgets/busy_button.dart';
import 'package:worlad/app/widgets/news_body.dart';
import 'package:worlad/core/navigators/routes.dart';
import 'package:worlad/core/utils/greeting_utils.dart';
import 'package:worlad/core/utils/string_utils.dart';
import 'package:worlad/features/news/data/model/news_model.dart';
import 'package:worlad/features/news/presentation/pages/view_news.dart';

class SportNews extends StatefulWidget {
  const SportNews({Key? key}) : super(key: key);

  @override
  State<SportNews> createState() => _SportNewsState();
}

TextEditingController _searchController = TextEditingController();

class _SportNewsState extends State<SportNews> {
  @override
  String _searchText = '';
  @override
  void initState() {
    _searchText = _searchController.text.trim();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.trim();
      });
    });
    _handleNewsData();
    super.initState();
  }

  Future<void> _handleNewsData() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<NewsVieModel>(context, listen: false)
          .handlesportNews(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsVieModel>(context);
    final List<Article>? _newsList;
    _newsList = _searchText.isEmpty
        ? newsProvider.sportNewsData?.articles
        : newsProvider.sportNewsData?.articles!
            .where((item) => item.title!.contains(
                  RegExp(
                    StringUtil.escapeSpecial(_searchText),
                    caseSensitive: false,
                  ),
                ))
            .toList();
    return Scaffold(
      body: newsProvider.isNotAccessd == false
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Opps somethings went wrong...',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  const Gap(10),
                  AppBusyButton(
                      butttonText: 'Retry',
                      onpressed: () async {
                        await _handleNewsData();
                        setState(() {});
                      })
                ],
              ),
            )
          : _newsList == null
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.appColour,
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 100),
                  child: _newsList.isNotEmpty
                      ? ListView(
                          children: _newsList
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.viewNewsPage,
                                        arguments: ViewsNewsParam(
                                            url: e.url,
                                            title: e.title,
                                            description: e.description,
                                            author: e.author,
                                            image: e.urlToImage,
                                            publishedAt: TimeFmt.datePublished(
                                                DateTime.parse(
                                                    e.publishedAt.toString())),
                                            content: e.content,
                                            source: e.source?.name));
                                  },
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: NewsBody(
                                        title: e.title,
                                        description: e.description,
                                        sourceName: e.source!.name,
                                        urlTOImage: e.urlToImage,
                                        publishedAt: TimeFmt.datePublished(
                                            DateTime.parse(
                                                e.publishedAt.toString())),
                                      )),
                                ),
                              )
                              .toList())
                      : const Text('We can\'t find result for this request')),
    );
  }
}
