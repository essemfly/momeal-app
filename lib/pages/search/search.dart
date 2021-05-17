import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momeal_app/controllers/search.dart';
import 'package:momeal_app/pages/common/page_with_topnav.dart';
import 'package:momeal_app/pages/product/list.dart';

class _SearchBar extends StatelessWidget {
  final _inputController = TextEditingController();
  final focusNode;
  final SearchController controller;
  final RxBool _canShowCancel = false.obs;
  static const _label = '검색어를 입력해 주세요.';

  get canShowCancel => _canShowCancel.value || controller.hasSearched;

  _SearchBar({required this.controller, required this.focusNode}) {
    _inputController.text = controller.keyword.value;
    focusNode.unfocus();
    focusNode.addListener(() {
      if (focusNode.hasFocus) _canShowCancel.value = true;
    });
  }

  resetForm() {
    focusNode.unfocus();
    controller.resetSearch();
    _inputController.text = "";
  }

  submitForm() {
    focusNode.unfocus();
    controller.search(_inputController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          focusNode: focusNode,
          controller: _inputController,
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            submitForm();
            _inputController.text = value;
          },
          autofocus: false,
          autocorrect: false,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: submitForm,
            ),
            suffixIcon: canShowCancel
                ? IconButton(
                    icon: Icon(Icons.close_rounded),
                    onPressed: () => resetForm(),
                  )
                : null,
            labelText: _label,
            border: InputBorder.none,
            fillColor: const Color(0xffF5F5F5),
            filled: true,
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  final void Function() backToHome;
  final controller = SearchController.to();
  final _focusNode = FocusNode();
  SearchPage({required this.backToHome});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: PageWithTopNav(
          title: "검색",
          child: Column(
            children: [
              _SearchBar(
                controller: controller,
                focusNode: _focusNode,
              ),
              Expanded(
                child: controller.hasSearched
                    ? ProductListPage(
                        title: "",
                        searchKeyword: controller.keyword.value,
                        onBackTap: controller.resetSearch,
                        onlyList: true,
                      )
                    : Container(),
              ),
            ],
          ),
          onBackTap: backToHome,
          scrollable: false,
          hideBackButton: true,
        ),
      ),
    );
  }
}
