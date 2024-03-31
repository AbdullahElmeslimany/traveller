import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:traveller/model/constant/suggest_list.dart';

import '../../detials_places/detials_places.dart';

suggestHomePage() {
  return Container(
    margin: const EdgeInsets.only(top: 15, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInRightBig(
              child: const Text(
                "اماكن مقترحة",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "الكل",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        FadeInLeft(
          child: Container(
            // decoration: const BoxDecoration(color: Color.fromARGB(123, 255, 255, 255)),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            height: 135,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(DetialslsPlease(
                        name: suggestList[index]["name"],
                        image: suggestList[index]["image"],
                        time: "time",
                        detials: "detials"));
                  },
                  child: Container(
                    // padding: const EdgeInsets.all(9),
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white),
                    height: 80,
                    width: 105,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.asset(
                              suggestList[index]["image"],
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Gap(3),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            suggestList[index]["name"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(4),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 17,
                                color: Colors.orange,
                              ),
                              Text(
                                suggestList[index]["location"].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
