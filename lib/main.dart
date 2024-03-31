import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveller/view/login_signup/login.dart';
import 'controller/cubit_image/select_image_cubit.dart';
import 'modelview/cubit/Add_Project_cubit/add_project_cubit.dart';
import 'modelview/cubit/get_postion/get_postion_cubit.dart';
import 'modelview/cubit/login_regester_cubit/login_and_regester_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'المنصة الالكترونية لدعم السياحة في مصر',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: TextTheme(bodyMedium: GoogleFonts.alexandria()),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}


//a@a.com
//123123