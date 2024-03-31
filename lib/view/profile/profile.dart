import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'helper/body_items.dart';
import 'helper/header_info.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الحساب"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // headerInfo(context),
                  const Gap(10),
                  bodyItems(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
