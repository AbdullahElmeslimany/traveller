import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller/view/home/homepage.dart';
import 'package:video_player/video_player.dart';

import '../video/cubit/data_get_cubit.dart';

class DetialslsPlease extends StatefulWidget {
  final String name;
  final image;
  final String time;
  final String detials;
  final String video;
  final data;

  const DetialslsPlease({
    Key? key,
    required this.name,
    required this.image,
    required this.time,
    required this.detials,
    required this.video,
    required this.data,
  }) : super(key: key);

  @override
  State<DetialslsPlease> createState() => _DetialslsPleaseState();
}

class _DetialslsPleaseState extends State<DetialslsPlease> {
  bool ischange = false;
  late VideoPlayerController controllerVideo;

  @override
  void initState() {
    super.initState();
    controllerVideo = VideoPlayerController.networkUrl(Uri.parse(widget.video))
      ..initialize().then((_) {
        setState(() {
          controllerVideo.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    controllerVideo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DataGetCubit>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              controllerVideo.value.isInitialized
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              controllerVideo.value.isPlaying
                                  ? controllerVideo.pause()
                                  : controllerVideo.play();
                            });
                          },
                          child: AspectRatio(
                            aspectRatio: controllerVideo.value.aspectRatio,
                            child: VideoPlayer(controllerVideo),
                          ),
                        ),
                      ),
                    )
                  : Image.asset("assets/icons/progress.png"),
              const Gap(15),
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
              Container(
                height: 400,
                child: Stack(
                  children: [
                    BlocBuilder<DataGetCubit, DataGetState>(
                      builder: (context, state) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 270,
                            width: MediaQuery.sizeOf(context).width - 70,
                            margin: const EdgeInsets.only(top: 15, left: 5),
                            child: cubit.imageShow == null
                                ? Image.asset("assets/icons/move.png")
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image: cubit.imageShow,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: widget.data["photo"].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 2),
                              child: Hero(
                                tag: widget.data["photo"][index].toString(),
                                child: CachedNetworkImage(
                                  imageUrl: widget.data["photo"][index],
                                  imageBuilder: (context, imageProvider) =>
                                      imageProvider != null
                                          ? InkWell(
                                              onTap: () {
                                                cubit.changeimageAndShow(
                                                    image: imageProvider);
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                child: Image(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                  height: 60,
                                                  width: 60,
                                                ),
                                              ),
                                            )
                                          : Image.asset(
                                              "assets/icons/image.png"),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
              const Gap(10),
              const Row(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Text(
                  //     "تفاصيل",
                  //     style:
                  //         TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                ],
              ),
              // Container(
              //   margin: const EdgeInsets.all(15),
              //   child: const Text(
              // "تقع هذه المحمية عند التقاء خليج السويس وخليج العقبة، وتمثل الحافة الشرقية لمحمية رأس محمد حائطاً صخرياً مع مياه الخليج الذي توجد به الشعاب المرجانية، كما توجد قناة المانجروف التي تفصل بين شبه جزيرة رأس محمد وجزيرة البعيرة بطول حوالي 250 م. وتتميز منطقة رأس محمد بالشواطئ المرجانية الموجودة في أعماق المحيط المائى لرأس محمد والأسماك الملونة والسلاحف البحرية المهددة بالانقراض والأحياء المائية النادرة، وتحيط الشعاب المرجانية برأس محمد من كافه جوانبها البحرية كما تشكل تكوينا فريدا حيث أن هذا التكوين له الأثر الكبير في تشكيل الحياة الطبيعية بالمنطقة كما تشكل الانهيارات الأرضية «الزلازل» تكوين الكهوف المائية أسفل الجزيرة كما أن المحمية موطن للعديد من الطيور والحيوانات الهامة مثل: الوعل النوبى بالمناطق الجبلية وأنواع الثدييات الصغيرة والزواحف والحشرات والتي لا تظهر إلا بالليل، كما أن المحمية موطن للعديد من الطيورالهامة مثل البلشونات والنوارس. وتعتبر مساحتها 480 كم. وتمتاز بطقس شديد الحرارة صيفا ومعتدل شتاء. لماذا اعلنت راس محمد محمية طبيعية....اعلنت راس محمد محمية طبيعية لما تحتوية على عدد من الأنظمة الايدلوجية الهامة وعالية الحساسية مثل (الشعب المرجانية، وبيئة المنجروف. وبيئة الادوية الصحراوية، والبئات الساحلية وتتمثل في سهول طينية واراضى ملحية، وبيئة الحشائش البحرية وهذه المحمية من أشهر معالم سيناء)",
              //   style: TextStyle(fontSize: 13, color: Colors.grey),
              // ),
              // ),
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
