import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'name_change/name_change.dart';

headerInfo(BuildContext context, {required cubit}) {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: const Icon(Icons.person),
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
              return nameChangeSheetButton(cubit: cubit);
            },
          );
        },
        child: const Column(
          children: [Text("Dominic Ovo"), Text("@dominic_ovo")],
        ),
      )
    ],
  );
}
