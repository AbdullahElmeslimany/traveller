import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:traveller/model/textfromfieldcustom.dart';

nameChangeSheetButton({required StateStreamableSource cubit}) {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  GlobalKey<FormState> namechangesheet = GlobalKey<FormState>();
  return Container(
    // height: 1500,
    width: Get.width,
    padding: const EdgeInsets.all(16),
    child: Form(
      key: namechangesheet,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(12),
            textFromFieldcustom(
              width: Get.width - 60,
              controller: firstname,
              text: "First Name",
            ),
            // textFromFieldcustom(
            //     width: Get.width - 60, controller: lastname, text: 'Last Name'),
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
                        if (namechangesheet.currentState!.validate()) {
                          // cubit.add(firstname.text);
                          Get.back();
                        }
                      },
                      child: Text("Save")),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
