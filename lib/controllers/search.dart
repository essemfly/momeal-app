import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController {
  static SearchController to() => Get.find();

  final RxBool _hasSearched = false.obs;
  get hasSearched => _hasSearched.value;
  final RxString keyword = "".obs;

  final FocusNode focusNode = FocusNode();
  final inputController = TextEditingController();
  final RxBool canShowCancel = false.obs;

  SearchController() {
    focusNode.unfocus();
    focusNode.addListener(() {
      if (focusNode.hasFocus)
        canShowCancel.value = true;
      else
        canShowCancel.value = inputController.text != "";
    });
    inputController.addListener(() {
      canShowCancel.value = inputController.text != "";
    });
  }

  reset() {
    focusNode.unfocus();
    canShowCancel.value = false;
    _hasSearched.value = false;
    inputController.text = "";
  }

  search() async {
    focusNode.unfocus();
    if (inputController.text == "") return;
    _hasSearched.value = true;
    keyword.value = inputController.text;
  }
}
