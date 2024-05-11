import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../modelview/controller/controller/bookly_cubit/booking_cubit.dart';

boolySuggetSheet(BuildContext context) {
  final cubit = BlocProvider.of<BookingCubit>(context);

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "اختر مكانك",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(25),
              Container(
                width: MediaQuery.sizeOf(context).width - 25,
                height: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
              )
            ],
          ),
        ),
      );
    },
  );
}

// Get.snackbar("تم الحجز بنجاح", "");
// Get.offAll(const MyHomePage());
