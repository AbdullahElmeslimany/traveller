import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:traveller/model/constant/page_choose_list.dart';
import 'package:traveller/model/constant/suggest_list.dart';
import 'package:traveller/modelview/cubit/categoris_cubit/get_places_data_cubit.dart';
import '../detials_places/detials_places.dart';

class ResiltSearchPage extends StatelessWidget {
  final name;
  const ResiltSearchPage({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetPlacesDataCubit>(context);
    cubit.getData(place: name.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 210, 210, 210),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name.toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.location_on_outlined),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(239, 255, 255, 255),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
              child: Container(
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                FadeInRightBig(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pageNameSearch.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MaterialButton(
                            onPressed: () {},
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  pageNameSearch[index]["name"],
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                BlocConsumer<GetPlacesDataCubit, GetPlacesDataState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is WaitingDataState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is SuccessDataState) {
                      return Expanded(
                          child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: FadeInUpBig(
                          child: ListView.builder(
                            itemCount: cubit.dataList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(DetialslsPlease(
                                      name: cubit.dataList[index]['name'],
                                      image: suggestList[index]["image"],
                                      time: "15",
                                      detials: "detials"));
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  height: 150,
                                  width: MediaQuery.sizeOf(context).width - 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(
                                          199, 233, 233, 233)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 7,
                                          child: Container(
                                              padding: const EdgeInsets.all(15),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    cubit.dataList[index]
                                                        ["name"],
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(Icons
                                                          .location_on_outlined),
                                                      Text(cubit.dataList[index]
                                                              ["place"]
                                                          .toString()),
                                                    ],
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Icon(Icons.timer),
                                                      Text("15 min"),
                                                    ],
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Icon(Icons.person),
                                                      Text("1500 / اليوم"),
                                                    ],
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Icon(Icons
                                                          .attach_money_outlined),
                                                      Text("70 ج"),
                                                    ],
                                                  ),
                                                ],
                                              ))),
                                      Expanded(
                                          flex: 5,
                                          child: SizedBox(
                                            height: 150,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.asset(
                                                suggestList[index]["image"],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ));
                    }
                    return const Center(child: Text("لا توجد نتائج حاليا"));
                  },
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
