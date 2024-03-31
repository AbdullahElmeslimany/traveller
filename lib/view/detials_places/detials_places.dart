import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller/view/home/homepage.dart';

class DetialslsPlease extends StatefulWidget {
  final String name;
  final String image;
  final String time;
  final String detials;

  const DetialslsPlease({
    Key? key,
    required this.name,
    required this.image,
    required this.time,
    required this.detials,
  }) : super(key: key);

  @override
  State<DetialslsPlease> createState() => _DetialslsPleaseState();
}

class _DetialslsPleaseState extends State<DetialslsPlease> {
  bool ischange = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  child: Image.asset(widget.image)),
              const Gap(10),
              Text(
                widget.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  itemOverView(
                      icon: Icon(
                        Icons.access_time,
                        color: Colors.green[700],
                      ),
                      title: " 3 ساعة ",
                      discription: "الوقت"),
                  itemOverView(
                      icon: Icon(
                        Icons.cloud,
                        color: Colors.blue[500],
                      ),
                      title: " 24 C ",
                      discription: "الحرارة"),
                  itemOverView(
                      icon: Icon(
                        Icons.star_purple500_outlined,
                        color: Colors.yellow[700],
                      ),
                      title: "4.5",
                      discription: "التقييم"),
                ],
              ),
              const Gap(15),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "تفاصيل",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: const Text(
                  "تقع هذه المحمية عند التقاء خليج السويس وخليج العقبة، وتمثل الحافة الشرقية لمحمية رأس محمد حائطاً صخرياً مع مياه الخليج الذي توجد به الشعاب المرجانية، كما توجد قناة المانجروف التي تفصل بين شبه جزيرة رأس محمد وجزيرة البعيرة بطول حوالي 250 م. وتتميز منطقة رأس محمد بالشواطئ المرجانية الموجودة في أعماق المحيط المائى لرأس محمد والأسماك الملونة والسلاحف البحرية المهددة بالانقراض والأحياء المائية النادرة، وتحيط الشعاب المرجانية برأس محمد من كافه جوانبها البحرية كما تشكل تكوينا فريدا حيث أن هذا التكوين له الأثر الكبير في تشكيل الحياة الطبيعية بالمنطقة كما تشكل الانهيارات الأرضية «الزلازل» تكوين الكهوف المائية أسفل الجزيرة كما أن المحمية موطن للعديد من الطيور والحيوانات الهامة مثل: الوعل النوبى بالمناطق الجبلية وأنواع الثدييات الصغيرة والزواحف والحشرات والتي لا تظهر إلا بالليل، كما أن المحمية موطن للعديد من الطيورالهامة مثل البلشونات والنوارس. وتعتبر مساحتها 480 كم. وتمتاز بطقس شديد الحرارة صيفا ومعتدل شتاء. لماذا اعلنت راس محمد محمية طبيعية....اعلنت راس محمد محمية طبيعية لما تحتوية على عدد من الأنظمة الايدلوجية الهامة وعالية الحساسية مثل (الشعب المرجانية، وبيئة المنجروف. وبيئة الادوية الصحراوية، والبئات الساحلية وتتمثل في سهول طينية واراضى ملحية، وبيئة الحشائش البحرية وهذه المحمية من أشهر معالم سيناء)",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 15,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          onPressed: () {
                            Get.snackbar("تم الحجز بنجاح", "");
                            Get.offAll(const MyHomePage());
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
                    InkWell(
                      onTap: () {
                        setState(() {
                          ischange = !ischange;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: ischange == true
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 40,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: Colors.grey,
                                size: 40,
                              ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row itemOverView({
    required Icon icon,
    required String title,
    required String discription,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              discription,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500]),
            )
          ],
        ),
        icon,
      ],
    );
  }
}
