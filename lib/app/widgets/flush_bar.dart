import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void appFlushBar(BuildContext context, String title, String message) {
  Flushbar(
    title: title,
    titleColor: Colors.red,
    titleSize: 20,
    messageSize: 16,
    flushbarPosition: FlushbarPosition.TOP,
    message: message,
    duration: const Duration(seconds: 4),
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    flushbarStyle: FlushbarStyle.FLOATING,
  ).show(context);
}
