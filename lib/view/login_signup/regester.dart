import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:traveller/view/home/homepage.dart';
import 'package:traveller/view/login_signup/login.dart';
import '../../modelview/controller/controller/regester_controller.dart';
import '../../model/textfromfieldcustom.dart';
import '../../modelview/cubit/login_regester_cubit/login_and_regester_cubit.dart';

class RegesterPage extends StatelessWidget {
  const RegesterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginAndRegesterCubit>(context);

    return Scaffold(
      body: BlocConsumer<LoginAndRegesterCubit, LoginAndRegesterState>(
        listener: (BuildContext context, LoginAndRegesterState state) {
          if (state is ErrorState) {
            Get.snackbar("Error", state.message);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: cubit.loading,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/logo-remove.png",
                            height: 200,
                            width: 200,
                          ),
                        ),
                        const Gap(25),
                        const Text(
                          "حساب جديد",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Gap(12),
                        Form(
                          key: regesterKey,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 15),
                            // height: 210,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "الاسم",
                                ),
                                const Gap(7),
                                textFromFieldcustom(
                                    backgroundAnable: true,
                                    rtl: true,
                                    keyboardType: TextInputType.name,
                                    hight: 18,
                                    width:
                                        MediaQuery.sizeOf(context).width - 50,
                                    controller: namecontrol,
                                    text: ""),
                                const Gap(10),
                                const Text(
                                  "البريد الالكتروني",
                                ),
                                const Gap(7),
                                textFromFieldcustom(
                                    backgroundAnable: true,
                                    keyboardType: TextInputType.emailAddress,
                                    hight: 18,
                                    width:
                                        MediaQuery.sizeOf(context).width - 50,
                                    controller: emailRController,
                                    text: ""),
                                const Gap(10),
                                const Text(
                                  "كلمة المرور",
                                ),
                                const Gap(7),
                                textFromFieldcustom(
                                    pass: true,
                                    backgroundAnable: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    hight: 18,
                                    width:
                                        MediaQuery.sizeOf(context).width - 50,
                                    controller: passwordRController,
                                    text: ""),
                              ],
                            ),
                          ),
                        ),
                        const Gap(15),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber[800],
                            ),
                            width: MediaQuery.sizeOf(context).width / 1.3,
                            child: MaterialButton(
                              height: 30,
                              child: const Text(
                                "انشاء الحساب",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () async {
                                if (regesterKey.currentState!.validate()) {
                                  cubit.regester(
                                      admin: true,
                                      name: namecontrol.text,
                                      email: emailRController.text,
                                      password: passwordRController.text);
                                  // Get.to(const MyHomePage());
                                }
                              },
                            ),
                          ),
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            const Text("لدي حساب:  ",
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                            InkWell(
                              onTap: () {
                                Get.offAll(
                                  const LoginPage(),
                                );
                              },
                              child: const Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
