import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewNews extends StatefulWidget {
  const ViewNews({Key? key, required this.params}) : super(key: key);
  final ViewsNewsParam params;
  @override
  State<ViewNews> createState() => _ViewNewsState();
}

class _ViewNewsState extends State<ViewNews> {
  @override
  Widget build(BuildContext context) {
    Uri _url = Uri.parse("${widget.params.url}");
    Logger().d(_url);

    void _launchUrl() async {
      if (!await launchUrl(_url)) throw 'Could not launch $_url';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColor.appColour,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.appColour,
            )),
        title: const Text(
          'News',
          style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: AppColor.appColour),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 33, top: 10, left: 29),
              child: Text(
                widget.params.title.toString(),
                style: const TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 5,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _launchUrl(),
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.appColour,
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.params.source.toString(),
                            style: const TextStyle(
                                fontSize: 17,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 33,
                top: 26,
                left: 32,
              ),
              child: Text(
                widget.params.description.toString(),
                style: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 31),
              child: widget.params.title != null
                  ? Hero(
                      tag: 'newsImage',
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        imageUrl: widget.params.image.toString(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )
                  : const Text(''),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 31, top: 46),
              child: Text(
                widget.params.content.toString(),
                style: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Text(
                widget.params.publishedAt.toString(),
                style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                widget.params.author.toString(),
                style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            const Gap(30)
          ],
        ),
      ),
    );
  }
}

class ViewsNewsParam {
  ViewsNewsParam(
      {required this.title,
      required this.description,
      required this.author,
      required this.image,
      required this.publishedAt,
      required this.content,
      required this.source,
      required this.url});
  final String? title;
  final String? description;
  final String? author;
  final String? image;
  final String? publishedAt;
  final String? content;
  final String? source;
  final String? url;
}
