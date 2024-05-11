import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:traveller/modelview__/logic__/get_postion/get_postion_cubit.dart';
import 'package:traveller/view/booking_page/booking_page.dart';
import 'package:traveller/view/home/homepage_helper/app_bar_custom.dart';
import 'package:traveller/view/home/homepage_helper/benefits_card.dart';
import 'package:traveller/view/home/homepage_helper/categories_homepage.dart';
import 'package:traveller/view/home/homepage_helper/suggestion_homepage.dart';
import 'package:traveller/modelview__/dropdown_and_search/dropdown_and_search.dart';

import '../../modelview__/logic__/categoris_cubit/get_places_data_cubit.dart';

class MyHomePage extends StatelessWidget {
  final id;
  const MyHomePage({Key? key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetPostionCubit>(context);
    final cubitData = BlocProvider.of<GetPlacesDataCubit>(context);
    cubitData.getDataAll();
    //get Gps
    cubit.getPostion();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(246, 240, 240, 240),
        body: BlocBuilder<GetPostionCubit, GetPostionState>(
          builder: (context, state) {
            if (state is WaitingGetPostionState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
                child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appBarCustom(
                        address: cubit.placemark[0].subAdministrativeArea!),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInDown(
                          child: const Text(
                            "المال ليس الغاية\nالوحيدة للسفر",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(BookingPage(
                                id: id,
                              ));
                            },
                            child: Image.asset(
                              "assets/icons/booking.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    dropDownAndSearch(id: id),
                    categoriesHomePage(),
                    suggestHomePage(cubitData, id: id),
                    benefitsCard(context)
                  ],
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}
