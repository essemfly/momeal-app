import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momeal_app/controllers/category.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/pages/common/all_list.dart';
import 'package:momeal_app/pages/common/all_page.dart';
import 'package:momeal_app/pages/product/list.dart';

class CategoryPage extends StatelessWidget {
  final void Function() backToHome;
  final controller = CategoryController.to();

  CategoryPage({required this.backToHome});

  @override
  Widget build(BuildContext context) {
    return Obx(() => IndexedStack(
          children: [
            AllPage('모든 밀키트 메뉴', AllList.make<Category>(controller.items),
                backToHome),
            ProductListPage(
              title: controller.selected?.displayName ?? "",
              onBackTap: controller.unselect,
              category: controller.selected ??
                  Category(name: "", thumbnail: "", label: ""),
            ),
          ],
          index: controller.isSelected ? 1 : 0,
        ));
  }
}
