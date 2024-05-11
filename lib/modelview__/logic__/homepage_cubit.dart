import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit() : super(HomepageInitial());

//get firebase

  get() async {
    var firestore = await FirebaseFirestore.instance.collection('places').get();
    List dataFirebase = [];
    dataFirebase.addAll(firestore.docs);
  }
}
