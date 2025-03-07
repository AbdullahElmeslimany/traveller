import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:traveller/modelview/cubit/get_postion/get_postion_cubit.dart';
import 'package:traveller/view/home/homepage_helper/app_bar_custom.dart';
import 'package:traveller/view/home/homepage_helper/benefits_card.dart';
import 'package:traveller/view/home/homepage_helper/categories_homepage.dart';
import 'package:traveller/view/home/homepage_helper/suggestion_homepage.dart';
import 'package:traveller/modelview/dropdown_and_search/dropdown_and_search.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetPostionCubit>(context);
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
                    FadeInDown(
                      child: const Text(
                        "المال ليس الغاية\nالوحيدة للسفر",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Gap(10),
                    dropDownAndSearch(),
                    categoriesHomePage(),
                    suggestHomePage(),
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
