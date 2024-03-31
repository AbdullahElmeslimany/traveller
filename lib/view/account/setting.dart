import 'package:flutter/material.dart';

import 'bodypart/bodypart.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الاعدادات",
        ),
      ),
      body: bodyPart(),
    );
  }
}
