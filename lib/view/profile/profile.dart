import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../modelview/cubit/profile_cubit/get_data_profile_cubit.dart';
import 'helper/body_items.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetDataProfileCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("الحساب"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // headerInfo(context),
                  const Gap(10),
                  bodyItems(cubit: cubit),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
