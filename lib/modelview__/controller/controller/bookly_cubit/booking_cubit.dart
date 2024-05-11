import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../view/home/homepage.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
  RangeValues currentRangeValues = const RangeValues(300, 1500);
  changeRange(value) {
    currentRangeValues = value;
    emit(SuccessBooklyState(currentRangeValues: currentRangeValues));
  }

  addBooking(
      {required start,
      required end,
      required person,
      required room,
      required place,
      required id,
      required String hotel}) async {
    FirebaseFirestore.instance.collection("Booking").add({
      "priceLow": currentRangeValues.start,
      "priceHigh": currentRangeValues.end,
      "place": place,
      "start": start,
      "end": end,
      "person": person,
      "room": room,
      "id": id,
      "hotel": hotel
    }).then((value) {
      Get.snackbar("تم الحجز بنجاح", "");
      Get.offAll(const MyHomePage());
    });
  }

  List data = [];
  getBooking({required id}) async {
    print("Start------------------");
    FirebaseFirestore.instance
        .collection("Booking")
        .where("id", isEqualTo: id)
        .get()
        .then((value) {
      data = value.docs;
      emit(SuccessGetBooklyState(data: data));
      print("end------------------");
    });
  }

  deleteBooking({required id}) async {
    await FirebaseFirestore.instance
        .collection("Booking")
        .doc(id)
        .delete()
        .then((value) {
      Get.snackbar("تم الحذف بنجاح", "", overlayColor: Colors.amber);
    });
  }
}
