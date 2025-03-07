import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'name_change/name_change.dart';

headerInfo(BuildContext context) {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Icon(Icons.person),
      ),
      InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),
            ),
            context: context,
            builder: (context) {
              return nameChangeSheetButton();
            },
          );
        },
        child: Column(
          children: [Text("Dominic Ovo"), Text("@dominic_ovo")],
        ),
      )
    ],
  );
}
