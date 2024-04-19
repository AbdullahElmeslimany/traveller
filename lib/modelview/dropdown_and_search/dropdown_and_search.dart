import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:get/get.dart';
import 'package:traveller/model/constant/governorates_list.dart';
import 'package:traveller/model/search_drop_down.dart';
import '../../view/result_search/result_search.dart';

CustomDropdown<Governorates> dropDownAndSearch() {
  return CustomDropdown<Governorates>.search(
    hintText: 'الاماكن',
    items: listGovernorates,
    excludeSelected: false,
    onChanged: (value) {
      Get.to(ResiltSearchPage(
        name: value,
      ));
    },
  );
}
