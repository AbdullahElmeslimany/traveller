import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_places_data_state.dart';

class GetPlacesDataCubit extends Cubit<GetPlacesDataState> {
  GetPlacesDataCubit() : super(GetPlacesDataInitial());
  List dataList = [];
  List dataListAll = [];
  bool loading = true;
  getData({required String place}) async {
    dataList.clear();
    emit(WaitingDataState());
    print(place);

    QuerySnapshot users = await FirebaseFirestore.instance
        .collection('places')
        .where("place", isEqualTo: place)
        .get();
    loading = false;
    dataList.addAll(users.docs);

    print(dataList.length);
    print(dataList[0]["photo"][0]);
    emit(SuccessDataState(data: dataList));
  }

  getDataAll() async {
    dataList.clear();
    emit(WaitingDataState());

    QuerySnapshot users =
        await FirebaseFirestore.instance.collection('places').get();
    loading = false;
    dataListAll.addAll(users.docs);

    print(dataListAll.length);
    print(dataListAll[0]["photo"][0]);
    emit(SuccessDataState(data: dataListAll));
  }
}
