import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveller/view/video/cubit/data_get_cubit.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  List data = [];
  bool loadingImage = true;
  getdata() async {
    QuerySnapshot da = await FirebaseFirestore.instance
        .collection("places")
        .where("name", isEqualTo: "العاصمة الادارية الجديدة")
        .get();
    setState(() {
      data.addAll(da.docs);
      loadingImage = false;
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DataGetCubit>(context);
    return Scaffold(
      body: loadingImage == true
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Container(
                height: 600,
                child: Stack(
                  children: [
                    BlocBuilder<DataGetCubit, DataGetState>(
                      builder: (context, state) {
                        return Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 270,
                            width: MediaQuery.sizeOf(context).width - 70,
                            margin: const EdgeInsets.only(top: 15, right: 5),
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
                      itemCount: data[0]["photo"].length,
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
                                tag: data[0]["photo"][index].toString(),
                                child: CachedNetworkImage(
                                  imageUrl: data[0]["photo"][index],
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
            ),
    );
  }
}
