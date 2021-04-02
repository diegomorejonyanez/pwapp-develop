import 'package:flutter/material.dart';

Widget commonAppBar(context, backgroundColor, iconColor) {
  return AppBar(
    elevation: 0,
    backgroundColor: backgroundColor,
    leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: iconColor,
        )),
  );
}
