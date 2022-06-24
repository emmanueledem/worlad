import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/view_models/news/news_view_model.dart';
import 'package:worlad/app/widgets/busy_button.dart';
import 'package:worlad/core/navigators/routes.dart';
import 'package:worlad/core/utils/greeting_utils.dart';
import 'package:worlad/core/utils/string_utils.dart';
import 'package:worlad/features/news/data/model/news_model.dart';
import 'package:worlad/features/news/presentation/pages/view_news.dart';

class BussinesNews extends StatefulWidget {
  const BussinesNews({Key? key}) : super(key: key);

  @override
  State<BussinesNews> createState() => _BussinesNewsState();
}

TextEditingController _searchController = TextEditingController();

class _BussinesNewsState extends State<BussinesNews> {
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
          .handleBussinessNews(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsVieModel>(context);

    final List<Article>? _newsList;
    _newsList = _searchText.isEmpty
        ? newsProvider.bussinesNewsData?.articles
        : newsProvider.bussinesNewsData?.articles!
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

class NewsBody extends StatelessWidget {
  NewsBody(
      {Key? key,
      required this.title,
      required this.description,
      required this.urlTOImage,
      required this.sourceName,
      this.publishedAt})
      : super(key: key);
  String? title;
  String? description;
  String? urlTOImage;
  String? sourceName;
  String? publishedAt;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: Colors.grey.shade300, width: 1.3, style: BorderStyle.solid),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 17, left: 17, right: 17, top: 17),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.toString(),
                        style: const TextStyle(
                            fontSize: 17,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const Gap(10),
                      Text(description.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: 143,
                    height: 96,
                    imageUrl: urlTOImage.toString(),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(sourceName.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: AppColor.appColour)),
                const SizedBox(
                  width: 19.36,
                ),
                Text(publishedAt.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: AppColor.appColour)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
