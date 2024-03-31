import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';

import '../../account/setting.dart';

appBarCustom({required String address}) {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(137, 130, 178, 255),
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.all(2),
            width: 45,
            height: 45,
            child: Image.asset("assets/icons/boy.png")),
        FadeIn(
          duration: const Duration(seconds: 2),
          child: Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 17,
                color: Colors.redAccent,
              ),
              Text(
                address,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              Get.to(const SettingPage());
            },
            icon: const Icon(Icons.settings))
      ],
    ),
  );
}
