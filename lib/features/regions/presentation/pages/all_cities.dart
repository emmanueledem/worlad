import 'package:flutter/material.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/shared/shared_styles.dart';
import 'package:worlad/app/shared/text_style.dart';

class AllCities extends StatefulWidget {
  const AllCities({Key? key}) : super(key: key);

  @override
  State<AllCities> createState() => _AllCitiesState();
}

class _AllCitiesState extends State<AllCities> {
  final TextEditingController _citiesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: AppColor.appColour,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Cities',
            style: TextStyle(
                color: Color(0xff0A191E),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontFamily: 'poppins'),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: TextFormField(
                controller: _citiesController,
                validator: (String? value) {
                  return (value == null || value.isEmpty)
                      ? 'City Name is required'
                      : null;
                },
                style: const TextStyle(
                    color: Colors.black87, fontFamily: 'poppins', height: 1.3),
                decoration: kCountryInputDecorationStyle.copyWith(
                    labelText: 'Search a City',
                    prefixIcon:
                        const Icon(Icons.search, color: AppColor.appColour)),
                autocorrect: true,
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: const [
                  Card(
                    child: ListTile(
                      title: Text('Name: Mansa', style: klistTileTitle),
                      subtitle: Text(
                        'City Type: Capital, population: 4378, timezone: Africa/Lusaka',
                        style: kListTileSubtitle,
                      ),
                      isThreeLine: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
