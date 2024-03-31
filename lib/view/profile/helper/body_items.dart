import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../model/listprofile.dart';

bodyItems() {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: SizedBox(
      height: 280,
      child: ListView.builder(
        itemCount: profileitem.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(0.0)),
                ),
                context: context,
                builder: (context) {
                  return profileitem[index]["nav"];
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(profileitem[index]["icon"]),
                      ),
                      Text(profileitem[index]["name"])
                    ],
                  ),
                  Row(
                    children: [
                      Text(profileitem[index]["text"]),
                      Icon(profileitem[index]["go"]),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
