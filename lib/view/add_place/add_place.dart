import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller/modelview/cubit/Add_Project_cubit/add_place_cubit.dart';

import '../../modelview/controller/cubit_image/select_image_cubit.dart';
import '../../model/textfromfieldcustom.dart';
import 'helper/card_search.dart';

TextEditingController yearProjectController = TextEditingController();
TextEditingController selectedValue = TextEditingController();

class AddPlacePage extends StatelessWidget {
  const AddPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> addProjectKey = GlobalKey<FormState>();
    TextEditingController namePlaceController = TextEditingController();
    TextEditingController tempratureController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController rateController = TextEditingController();
    TextEditingController detialsPlaceController = TextEditingController();
    final cubit = BlocProvider.of<AddPlaceCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "اضافة وجهة جديدة",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: addProjectKey,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: BlocBuilder<SelectImageCubit, SelectImageState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(20),
                      if (BlocProvider.of<SelectImageCubit>(context).isdata ==
                          true)
                        InkWell(
                          onTap: () {
                            BlocProvider.of<SelectImageCubit>(context)
                                .selectImage();
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.file(
                                BlocProvider.of<SelectImageCubit>(context)
                                    .imagefile!,
                                height: 150,
                                width: 450,
                                fit: BoxFit.fitHeight,
                              )),
                        )
                      else
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<SelectImageCubit>(context)
                                  .selectImage();
                            },
                            icon: const Icon(
                              Icons.add_photo_alternate_rounded,
                              size: 50,
                            )),
                      const Gap(20),
                      textFromFieldcustom(
                          rtl: true,
                          hight: 18,
                          backgroundAnable: true,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: namePlaceController,
                          text: "اسم المكان"),
                      const Gap(15),
                      cardDropDown(context),

                      // textFromFieldcustom(
                      //     rtl: true,
                      //     hight: 18,
                      //     backgroundAnable: true,
                      //     width: MediaQuery.sizeOf(context).width - 30,
                      //     controller: yearProjectController,
                      //     keyboardType: TextInputType.number,
                      //     text: "السنة"),
                      // const Gap(15),
                      textFromFieldcustom(
                          rtl: true,
                          hight: 18,
                          backgroundAnable: true,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: timeController,
                          keyboardType: TextInputType.number,
                          text: "الوقت"),
                      const Gap(15),
                      textFromFieldcustom(
                          rtl: true,
                          hight: 18,
                          backgroundAnable: true,
                          width: MediaQuery.sizeOf(context).width - 30,
                          keyboardType: TextInputType.number,
                          controller: tempratureController,
                          text: "الحرارة"),
                      const Gap(15),
                      textFromFieldcustom(
                          rtl: true,
                          hight: 18,
                          backgroundAnable: true,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: rateController,
                          keyboardType: TextInputType.number,
                          text: "التقييم"),
                      const Gap(20),
                      const Gap(20),
                      textFromFieldcustom(
                          maxLines: 4,
                          length: true,
                          rtl: true,
                          hight: 18,
                          backgroundAnable: true,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: detialsPlaceController,
                          text: "التفاصيل"),
                      const Gap(50),
                      Container(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width / 1.22,
                        decoration: BoxDecoration(
                            color: Colors.amber[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          onPressed: () async {
                            if (addProjectKey.currentState!.validate()) {
                              cubit.addPlace(
                                  name: namePlaceController.text,
                                  time: timeController.text,
                                  tempreture: tempratureController.text,
                                  detils: detialsPlaceController.text,
                                  rate: rateController.text,
                                  place: yearProjectController.text);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            "حفظ",
                            style: GoogleFonts.alexandria(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
