import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller/model/textfromfieldcustom.dart';
import 'package:traveller/modelview/controller/controller/bookly_cubit/booking_cubit.dart';

bottomSheetCustom(BuildContext context, {required id, required place}) {
  TextEditingController startDayController = TextEditingController();
  TextEditingController endDayController = TextEditingController();
  TextEditingController padgetController =
      TextEditingController(text: "1000 : 4000");
  TextEditingController numRoomController = TextEditingController();
  TextEditingController personNumController = TextEditingController();
  RangeValues currentRangeValues = const RangeValues(1000, 4000);
  final cubit = BlocProvider.of<BookingCubit>(context);
  GlobalKey<FormState> booklyKey = GlobalKey<FormState>();

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Form(
        key: booklyKey,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocConsumer<BookingCubit, BookingState>(
                  listener: (context, state) {
                    if (state is SuccessBooklyState) {
                      currentRangeValues = state.currentRangeValues;
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        const Text(
                          "تفاصيل الحجز",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Gap(15),
                        RangeSlider(
                            // inactiveColor: Colors.amber,
                            activeColor: Colors.red,
                            max: 5000,
                            values: currentRangeValues,
                            divisions: 5000,
                            labels: RangeLabels(
                              currentRangeValues.start.round().toString(),
                              currentRangeValues.end.round().toString(),
                            ),
                            onChanged: (value) {
                              cubit.changeRange(value);
                              padgetController.text =
                                  "${value.end}:${value.start}";
                            }),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("0"), Text("5000")],
                        )
                      ],
                    );
                  },
                ),
                const Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textFromFieldcustom(
                        enabel: false,
                        keyboardType: TextInputType.number,
                        controller: padgetController,
                        width: MediaQuery.sizeOf(context).width / 1.3,
                        text: "Padget"),
                    const Text(
                      "جنيه",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textFromFieldcustom(
                        length: true,
                        lengthTall: 1,
                        keyboardType: TextInputType.number,
                        controller: personNumController,
                        width: MediaQuery.sizeOf(context).width / 1.3,
                        text: "عدد الافراد"),
                    const Text(
                      "شخص",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textFromFieldcustom(
                        length: true,
                        lengthTall: 1,
                        keyboardType: TextInputType.number,
                        controller: numRoomController,
                        width: MediaQuery.sizeOf(context).width / 1.3,
                        text: "عدد الغرف"),
                    const Text(
                      "غرفة",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Gap(20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "من",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Gap(50),
                    Text(
                      "الي",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        var start = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025),
                        );
                        if (start != null) {
                          startDayController.text =
                              "${start.day} / ${start.month} / ${start.year}";
                        } else {
                          startDayController.text = "";
                        }
                      },
                      child: textFromFieldcustom(
                          enabel: false,
                          controller: startDayController,
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          text: "Start Day"),
                    ),
                    InkWell(
                      onTap: () async {
                        var start = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025),
                        );
                        if (start != null) {
                          endDayController.text =
                              "${start.day} / ${start.month} / ${start.year}";
                        } else {
                          startDayController.text = "";
                        }
                      },
                      child: textFromFieldcustom(
                          enabel: false,
                          controller: endDayController,
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          text: "End Day"),
                    ),
                  ],
                ),
                const Gap(50),
                Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.sizeOf(context).width - 50,
                    decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                      onPressed: () {
                        if (booklyKey.currentState!.validate()) {
                          cubit.addBooking(
                              place: place,
                              start: startDayController.text,
                              end: endDayController.text,
                              person: personNumController.text,
                              room: numRoomController.text,
                              id: id);
                        }

                        // bottomSheetCustom(context);
                      },
                      child: Text(
                        "احجز الان",
                        style: GoogleFonts.alexandria(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
