import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:traveller/model/textfromfieldcustom.dart';

emailChangeSheetButton({required cubit}) {
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> emailchangesheet = GlobalKey<FormState>();
  return Container(
    width: Get.width,
    padding: const EdgeInsets.all(16),
    child: Form(
      key: emailchangesheet,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(12),
            textFromFieldcustom(
              width: Get.width - 60,
              controller: email,
              text: "Change Email",
            ),
            const Gap(39),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(7)),
                  child: MaterialButton(
                      onPressed: () {
                        if (emailchangesheet.currentState!.validate()) {
                          Get.back();
                        }
                      },
                      child: const Text("Save")),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
