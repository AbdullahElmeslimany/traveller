import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'data_get_state.dart';

class DataGetCubit extends Cubit<DataGetState> {
  DataGetCubit() : super(DataGetInitial());
  List data = [];
  var imageShow;

  changeimageAndShow({required image}) {
    imageShow = image;
    emit(ChangeImageAndShowState());
  }
}
