import 'package:animated_custom_dropdown/custom_dropdown.dart';

class Governorates with CustomDropdownListFilter {
  final String name;

  const Governorates(this.name);

  @override
  String toString() {
    return name;
  }

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}
