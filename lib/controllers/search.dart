import 'package:get/get.dart';

class SearchController {
  static SearchController to() => Get.find();

  final RxString keyword = "".obs;

  final RxBool _hasSearched = false.obs;
  get hasSearched => _hasSearched.value;

  resetSearch() {
    keyword.value = "";
    _hasSearched.value = false;
  }

  search(String newKeyword) async {
    keyword.value = newKeyword;
    _hasSearched.value = true;
  }
}
