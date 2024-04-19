import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'add_place_state.dart';

class AddPlaceCubit extends Cubit<AddPlaceState> {
  AddPlaceCubit() : super(AddPlaceInitial());
  addPlace({
    required String name,
    required String time,
    required String tempreture,
    required String detils,
    required String rate,
    required String place,
  }) async {
    CollectionReference project =
        FirebaseFirestore.instance.collection('places');
    await project.add({
      'name': name,
      'time': time,
      'tempreture': tempreture,
      'detils': detils,
      'rate': rate,
      'place': place,
    }).then((value) {
      Get.snackbar("تمت الاضافة وجهة جديد بنجاح", "");
    });
    emit(SucessAddState());
  }
}
