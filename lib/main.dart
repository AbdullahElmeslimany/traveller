import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller/modelview/cubit/profile_cubit/get_data_profile_cubit.dart';
import 'package:traveller/view/login_signup/login.dart';
import 'modelview/controller/cubit_image/select_image_cubit.dart';
import 'modelview/cubit/Add_Project_cubit/add_place_cubit.dart';
import 'modelview/cubit/categoris_cubit/get_places_data_cubit.dart';
import 'modelview/cubit/get_postion/get_postion_cubit.dart';
import 'modelview/cubit/login_regester_cubit/login_and_regester_cubit.dart';
import 'view/video/cubit/data_get_cubit.dart';
import 'view/video/photo.dart';
import 'view/video/video.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetPostionCubit()),
        BlocProvider(create: (context) => SelectImageCubit()),
        BlocProvider(create: (context) => LoginAndRegesterCubit()),
        BlocProvider(create: (context) => AddPlaceCubit()),
        BlocProvider(create: (context) => GetPlacesDataCubit()),
        BlocProvider(create: (context) => GetDataProfileCubit()),
        BlocProvider(create: (context) => DataGetCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'المنصة الالكترونية لدعم السياحة في مصر',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          textTheme: TextTheme(bodyMedium: GoogleFonts.alexandria()),
          useMaterial3: true,
        ),
        home: const LoginPage(),
        // home: const PhotoPage(),
      ),
    );
  }
}


//a@a.com
//123123