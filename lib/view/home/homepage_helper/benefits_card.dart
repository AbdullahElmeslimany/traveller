import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

benefitsCard(BuildContext context) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "فوائد السفر",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const Gap(15),
        FadeInRight(
            duration: const Duration(milliseconds: 1000),
            child: const Text("*السفر يعمق فهمنا للحياة")),
        FadeInRight(
            duration: const Duration(milliseconds: 1500),
            child: const Text("*الحياة في الخارج تزيدك فهماً لنفسك")),
        FadeInRight(
            duration: const Duration(milliseconds: 1900),
            child: const Text("*السفر يجعلنا أكثر إبداعاً")),
        FadeInRight(
            duration: const Duration(milliseconds: 2300),
            child: const Text("*الحياة في الخارج تحفّز على التعاطف")),
        FadeInRight(
            duration: const Duration(milliseconds: 2700),
            child: const Text("*السفر يحد من الضغط")),
        FadeInRight(
            duration: const Duration(milliseconds: 3000),
            child: const Text("*يجعلك اكثر حيوية")),
      ],
    ),
  );
}
