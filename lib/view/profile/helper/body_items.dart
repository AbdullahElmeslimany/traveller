import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'change_email/change_email.dart';
import 'change_password/change_password.dart';
import 'name_change/name_change.dart';

bodyItems({required StateStreamableSource cubit}) {
  List profileitem = [

    {
      "name": "Name",
      "icon": Icons.phone,
      "text": "Ahmad",
      "nav": nameChangeSheetButton(cubit: cubit)
    },
    {
      "name": "البريد الالكتروني",
      "icon": Icons.email,
      "text": "Ahmed@gmail.com",
      "nav": emailChangeSheetButton(cubit: cubit)
    },

    {
      "name": "Change Password",
      "icon": Icons.password,
      "text": "•••••••••••••••••",
      "nav": passWordChangeSheetButton(cubit: cubit)
    },

  ];

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
