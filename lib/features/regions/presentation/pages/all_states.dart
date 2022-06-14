import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:worlad/app/shared/colors.dart';
import 'package:worlad/app/shared/shared_styles.dart';
import 'package:worlad/app/shared/text_style.dart';

import '../../../../core/navigators/navigators.dart';

class AllStates extends StatefulWidget {
  const AllStates({Key? key}) : super(key: key);

  @override
  State<AllStates> createState() => _AllStatesState();
}

class _AllStatesState extends State<AllStates> {
  final TextEditingController _stateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: AppColor.appColour,
          centerTitle: true,
          title: const Text(
            'States',
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
                controller: _stateController,
                validator: (String? value) {
                  return (value == null || value.isEmpty)
                      ? 'State Name is required'
                      : null;
                },
                style: const TextStyle(
                    color: Colors.black87, fontFamily: 'poppins', height: 1.3),
                decoration: kCountryInputDecorationStyle.copyWith(
                    labelText: 'Search a State',
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
                      Navigator.pushNamed(context, Routes.allcitiesPage);
                    },
                    child: const Card(
                      child: ListTile(
                        title: Text('Name: Central Province', style: klistTileTitle,),
                        subtitle: Text('State Id: 02', style: kListTileSubtitle,),
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
          ],
        ));
  }
}
