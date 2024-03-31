import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:traveller/model/textfromfieldcustom.dart';

passWordChangeSheetButton() {
  TextEditingController passNewchange = TextEditingController();
  TextEditingController passOldchange = TextEditingController();
  GlobalKey<FormState> passChangeSheet = GlobalKey<FormState>();
  return SingleChildScrollView(
    child: Container(
      width: Get.width,
      padding: const EdgeInsets.all(16),
      child: Form(
        key: passChangeSheet,
        child: Column(
          children: [
            const Gap(12),
            textFromFieldcustom(
              width: Get.width - 60,
              controller: passOldchange,
              text: "Old Password",
            ),
            const Gap(5),
            textFromFieldcustom(
              width: Get.width - 60,
              controller: passNewchange,
              text: "Phone Number",
            ),
            const Gap(5),
            textFromFieldcustom(
              width: Get.width - 60,
              controller: passNewchange,
              text: "Phone Number",
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
                        if (passChangeSheet.currentState!.validate()) {
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
