import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modelview__/logic__/get_postion/get_postion_cubit.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetPostionCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تفاصيل العنوان",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cubit.placemark[0].toString(),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700),
          )
        ],
      ),
    );
  }
}
