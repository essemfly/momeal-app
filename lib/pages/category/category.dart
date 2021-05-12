import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momeal_app/controllers/category.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/pages/common/all_list.dart';
import 'package:momeal_app/pages/common/all_page.dart';
import 'package:momeal_app/pages/product/list.dart';

class CategoryPage extends StatefulWidget {
  final void Function() backToHome;
  final controller = CategoryController.to();

  CategoryPage({required this.backToHome});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _inPageNavIndex = 0;
  @override
  void initState() {
    widget.controller.selectedStream.listen((Category? c) {
      setState(() {
        _inPageNavIndex = c == null ? 0 : 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: [
        AllPage('모든 밀키트 메뉴', AllList.make<Category>(widget.controller.items),
            widget.backToHome),
        Obx(() => ProductListPage(
              title: widget.controller.selected?.displayName ?? "",
              onBackTap: widget.controller.unselect,
              category: widget.controller.selected ??
                  Category(name: "", thumbnail: "", label: ""),
            )),
      ],
      index: _inPageNavIndex,
    );
  }
}
