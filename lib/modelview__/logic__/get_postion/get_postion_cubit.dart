import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'get_postion_state.dart';

class GetPostionCubit extends Cubit<GetPostionState> {
  GetPostionCubit() : super(GetPostionInitial());
  bool loading = false;
  late List<Placemark> placemark;
  void getPostion() async {
    loading = false;
    emit(WaitingGetPostionState());
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (isLocationServiceEnabled == true) {
      //هل اعطاء الصلاحية
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        //طلب صلاحية
        permission = await Geolocator.requestPermission();
      } else {
        //يعطي الاحداثيات
        Position pos = await Geolocator.getCurrentPosition();
        print(pos.latitude);
        print(pos.longitude);

        placemark = await placemarkFromCoordinates(pos.latitude, pos.longitude);
        loading = true;
        emit(SuccessGetPostionState());

        print(placemark[0].locality);
        print(placemark[0].subAdministrativeArea);
        print(placemark[0].administrativeArea);
      }
    } else {
      Get.snackbar(
        "يرجي تشغيل الموقع",
        "",
        animationDuration: const Duration(seconds: 3),
      );
    }
  }
}
