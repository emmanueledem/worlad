import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/shared/shared_styles.dart';
import 'package:worlad/app/shared/text_style.dart';
import 'package:worlad/core/navigators/routes.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({Key? key}) : super(key: key);

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

TextEditingController _countryController = TextEditingController();

class _AllCountriesState extends State<AllCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Countries',
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
                controller: _countryController,
                validator: (String? value) {
                  return (value == null || value.isEmpty)
                      ? 'Country Name is required'
                      : null;
                },
                style: const TextStyle(
                    color: Colors.black87, fontFamily: 'poppins', height: 1.3),
                decoration: kCountryInputDecorationStyle.copyWith(
                    labelText: 'Search a Country',
                    prefixIcon:
                        const Icon(Icons.search, color: AppColor.appColour)),
                autocorrect: true,
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.allStatesPage);
                    },
                    child: const Card(
                      child: ListTile(
                        title: Text(
                          'Name: Afghanistan',
                          style: klistTileTitle,
                        ),
                        subtitle: Text(
                          'Abbreviation: Af',
                          style: kListTileSubtitle,
                        ),
                        trailing: Icon(
                          Icons.arrow_circle_right,
                          color: AppColor.appColour,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(80)
          ],
        ));
  }
}
