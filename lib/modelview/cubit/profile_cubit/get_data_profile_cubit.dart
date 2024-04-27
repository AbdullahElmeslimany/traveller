import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'get_data_profile_state.dart';

class GetDataProfileCubit extends Cubit<GetDataProfileState> {
  GetDataProfileCubit() : super(GetDataProfileInitial());
  List data = [];
  bool loading = true;
  getData({required String uID}) async {
    print(uID);
    emit(WaitingProfileState());
    QuerySnapshot users = await FirebaseFirestore.instance
        .collection('users')
        .where("Uid", isEqualTo: uID)
        .get();
    loading = false;
    data.addAll(users.docs);
    print(users.docs[0].id);
    print(data[0]["name"]);
    emit(SucessDataProfileState(data: data));
  }

  editData(
      {required String uID,
      required String name,
      required String email,
      required String newpassword,
      required String idunversty}) async {
    print(uID);
    // emit(WaitingProfileState());
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uID)
        .update({'email': email, 'name': name, 'idunversty': idunversty}).then(
            (value) async {
      final user = FirebaseAuth.instance.currentUser;

      await user?.updatePassword(newpassword);
      Get.snackbar("تمت تعديل البيانات بنجاح", "");
    });

    print(data[0]["name"]);
    emit(SucessDataProfileState(data: data));
  }
}
