import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../modelview/controller/controller/bookly_cubit/booking_cubit.dart';

class BookingPage extends StatelessWidget {
  final id;
  const BookingPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BookingCubit>(context);
    cubit.getBooking(id: id);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "حجزتك",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (state is SuccessGetBooklyState) {
            return ListView.builder(
              itemCount: cubit.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // height: 150,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Text(
                          cubit.data[index]["place"],
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const Gap(10),
                        fieldCustom(
                            key: "عدد الغرف : ",
                            index,
                            value: cubit.data[index]["room"]),
                        const Gap(10),
                        fieldCustom(
                            key: "عدد الاشخاص : ",
                            index,
                            value: cubit.data[index]["person"]),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            fieldCustom(
                                key: "من : ",
                                index,
                                value: cubit.data[index]["start"]),
                            fieldCustom(
                                key: "الي : ",
                                index,
                                value: cubit.data[index]["end"]),
                          ],
                        ),
                        const Gap(10),
                        fieldCustom(
                            key: "السعر : ",
                            index,
                            value: cubit.data[index]["priceLow"].toString()),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.red[700],
                                  borderRadius: BorderRadius.circular(10)),
                              child: MaterialButton(
                                onPressed: () {
                                  cubit.deleteBooking(id: cubit.data[index].id);
                                },
                                child: const Text(
                                  "الغاء الحجز",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  fieldCustom(int index, {required key, required value}) {
    return Row(
      children: [
        Text(
          key,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ],
    );
  }
}
