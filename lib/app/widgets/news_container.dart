// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class NewsContainer extends StatelessWidget {
//   NewsContainer({
//     Key? key,
//     required this.image,
//     required this.title,
//     required this.source,
//     required this.time,
//     required this.description,
//   }) : super(key: key);

//   String? image;
//   String? title;
//   String? source;
//   String? time;
//   String? description;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20, left: 23, right: 24, top: 20),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     Text(
//                       title.toString(),
//                       style: const TextStyle(
//                           fontSize: 17,
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xffC4C4C4)),
//                     ),
//                     const SizedBox(height: 9),
//                     Text(description!,
//                         style: const TextStyle(
//                             fontSize: 14,
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xffC4C4C4)))
//                   ],
//                 ),
//               ),
//               CachedNetworkImage(
//                 fit: BoxFit.cover,
//                 width: 100,
//                 height: 100,
//                 imageUrl: image.toString(),
//                 progressIndicatorBuilder: (context, url, downloadProgress) =>
//                     Center(
//                         child: CircularProgressIndicator(
//                             value: downloadProgress.progress)),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(source!,
//                       style: const TextStyle(
//                           fontSize: 12,
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xffC4C4C4))),
//                   const SizedBox(
//                     width: 19.36,
//                   ),
//                   // const Image(
//                   //     width: 2.03,
//                   //     height: 2,
//                   //     color: Color(0xff2F9FF8),
//                   //     image: AssetImage(Appset.ellipseImg)),
//                   const SizedBox(
//                     width: 19.36,
//                   ),
//                   Text(time!,
//                       style: const TextStyle(
//                           fontSize: 12,
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xffC4C4C4))),
//                 ],
//               ),
//               // Row(
//               //   children: const [
//               //     Image(
//               //         width: 16.26,
//               //         height: 16,
//               //         image: AssetImage('assets/app_icons/share.png')),
//               //     SizedBox(
//               //       width: 37.16,
//               //     ),
//               //     Image(
//               //         width: 16.26,
//               //         height: 16,
//               //         image: AssetImage('assets/app_icons/pocket.png')),
//               //   ],
//               // )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
