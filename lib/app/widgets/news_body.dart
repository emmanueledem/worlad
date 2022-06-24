import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:worlad/app/shared/colors.dart';
class NewsBody extends StatelessWidget {
const  NewsBody(
      {Key? key,
      required this.title,
      required this.description,
      required this.urlTOImage,
      required this.sourceName,
      this.publishedAt})
      : super(key: key);
 final  String? title;
 final String? description;
final  String? urlTOImage;
final  String? sourceName;
 final String? publishedAt;
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
