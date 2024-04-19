import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'select_image_state.dart';

class SelectImageCubit extends Cubit<SelectImageState> {
  SelectImageCubit() : super(SelectImageInitial());
  bool isdata = false;
  File? imagefile;
  selectImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagefile = File(file.path);
      isdata = true;
      emit(SuccessImageInitial());
      log(imagefile!.path);
    } else {
      log("message");
      emit(FeailImageInitial());
    }
  }
}
