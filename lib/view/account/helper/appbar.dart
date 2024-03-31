import 'package:flutter/material.dart';

appBar() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(
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
