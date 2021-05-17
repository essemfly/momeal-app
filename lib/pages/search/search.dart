import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momeal_app/controllers/search.dart';
import 'package:momeal_app/pages/common/page_with_topnav.dart';
import 'package:momeal_app/pages/product/list.dart';

class _SearchBar extends StatelessWidget {
  final SearchController controller;
  static const _label = '검색어를 입력해 주세요.';

  _SearchBar(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          focusNode: controller.focusNode,
          controller: controller.inputController,
          textInputAction: TextInputAction.search,
          onSubmitted: (value) => controller.search(),
          autofocus: false,
          autocorrect: false,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: controller.search,
            ),
            suffixIcon: controller.canShowCancel.value
                ? IconButton(
                    icon: Icon(Icons.close_rounded),
                    onPressed: controller.reset,
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
  SearchPage({required this.backToHome});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.focusNode.unfocus();
        },
        child: PageWithTopNav(
          title: "검색",
          child: Column(
            children: [
              _SearchBar(controller),
              Expanded(
                child: controller.hasSearched
                    ? ProductListPage(
                        title: "",
                        searchKeyword: controller.keyword.value,
                        onBackTap: controller.reset,
                        onlyList: true,
                      )
                    : Container(color: Colors.white),
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
