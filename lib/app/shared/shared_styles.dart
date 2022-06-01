import 'package:flutter/material.dart';
import 'package:worlad/app/shared/colors.dart';

const kCountryInputDecorationStyle = InputDecoration(
  fillColor: AppColor.appColour,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.appColour, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.appColour, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  labelStyle: TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.appColour,
    fontFamily: 'poppins',
    fontSize: 16,
  ),
);

const kConditionTextStyle = TextStyle(
  fontSize: 60.0,
);

const kTempTextStyle = TextStyle(fontSize: 60.0, color: Colors.white);
