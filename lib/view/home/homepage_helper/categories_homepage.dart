import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:traveller/model/constant/categorise_list.dart';

categoriesHomePage() {
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
                "الاقسام",
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
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            height: 85,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(9),
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: const Color.fromRGBO(13, 39, 86, 1)),
                      height: 60,
                      width: 60,
                      child: Image.asset(categories[index]["image"],
                          height: 50, width: 50),
                    ),
                    Text(
                      categories[index]["name"],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 11),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
