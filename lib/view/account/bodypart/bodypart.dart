import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveller/view/add_place/add_place.dart';
import 'package:traveller/view/address_detials/address_detials.dart';
import 'package:traveller/view/login_signup/login.dart';
import 'package:traveller/view/profile/profile.dart';

SafeArea bodyPart() {
  return SafeArea(
      child: Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: settingitem.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    if (settingitem[index]["name"] == "تسجيل الخروج") {
                      Get.offAll(() => const LoginPage());
                    } else if (settingitem[index]["name"] == "حذف الحساب") {
                      Get.defaultDialog(
                          title: "حذف الحساب",
                          content: const Text(""),
                          cancel: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: MaterialButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("الغاء"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: MaterialButton(
                                  onPressed: () {
                                    Get.offAll(const LoginPage());
                                  },
                                  child: const Text("حذف"),
                                ),
                              ),
                            ],
                          ));
                    } else {
                      Get.to(settingitem[index]["nav"]);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    height: 65,
                    child: Row(
                      children: [
                        Icon(settingitem[index]["icon"]),
                        Text(settingitem[index]["name"])
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ),
  ));
}

List settingitem = [
  {"name": "الحساب", "icon": Icons.person, "nav": const Profile()},
  {
    "name": "اضافة وجهة",
    "icon": Icons.add_circle_outline,
    "nav": const AddPlacePage()
  },
  {"name": "العنوان", "icon": Icons.location_on, "nav": const AddressPage()},
  {
    "name": "تسجيل الخروج",
    "icon": Icons.exit_to_app_rounded,
    "nav": const LoginPage()
  },
  {
    "name": "حذف الحساب",
    "icon": Icons.remove_circle_outline_rounded,
    "nav": ""
  },
];
