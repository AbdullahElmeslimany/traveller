import 'package:flutter/material.dart';
import 'package:traveller/view/profile/helper/change_email/change_email.dart';
import 'package:traveller/view/profile/helper/name_change/name_change.dart';

import '../view/profile/helper/change_password/change_password.dart';

List profileitem = [
  // {"name": "Gender", "icon": Icons.person, "text": "Male", "nav": Profile()},
  // {
  //   "name": "Birthday",
  //   "icon": Icons.bakery_dining_sharp,
  //   "text": "12-12-2000",
  //   "nav": null
  // },
  {
    "name": "Name",
    "icon": Icons.phone,
    "text": "Ahmad",
    "nav": nameChangeSheetButton()
  },
  {
    "name": "البريد الالكتروني",
    "icon": Icons.email,
    "text": "Ahmed@gmail.com",
    "nav": emailChangeSheetButton()
  },

  {
    "name": "Change Password",
    "icon": Icons.password,
    "text": "•••••••••••••••••",
    "nav": passWordChangeSheetButton()
  },
  // {
  //   "name": "Change  Lang",
  //   "icon": Icons.language,
  //   "text": "Arabic",
  //   "nav": null
  // },
];
