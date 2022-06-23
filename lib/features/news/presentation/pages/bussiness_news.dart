import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:worlad/app/shared/colors.dart';

class BussinesNews extends StatefulWidget {
  const BussinesNews({Key? key}) : super(key: key);

  @override
  State<BussinesNews> createState() => _BussinesNewsState();
}

class _BussinesNewsState extends State<BussinesNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 100),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1.3,
                      style: BorderStyle.solid),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 17, left: 17, right: 17, top: 17),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Preferencias temáticas y de integración de las cuestiones ESG: varían en función del país y del tipo de inversor - Funds People',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Gap(10),
                                Text(
                                    '\"El crecimiento económico de la eurozona se ha deteriorado drásticamente, cayendo a mínimos de 16 meses en junio\". Esta es la primera frase de S&P ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                          const Image(
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                              image: AssetImage(
                                  'assets/images/weatherResultImage.jpg'))
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text('CNN',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.appColour)),
                          SizedBox(
                            width: 19.36,
                          ),
                          Text('18:89',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.appColour)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
