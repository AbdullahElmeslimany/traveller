import 'package:flutter/material.dart';

appBar() {
  // ignore: prefer_const_constructors
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Padding(
        padding: EdgeInsets.only(
          top: 35,
          left: 26,
          bottom: 28,
        ),
        child: Text(
          "الاعدادات",
        ),
      ),
      Divider(
          // color: ColorApp.greylight,
          )
    ],
  );
}
