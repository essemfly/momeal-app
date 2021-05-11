import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momeal_app/controllers/category.dart';
import 'package:momeal_app/pages/common/all_list.dart';
import 'package:momeal_app/pages/common/all_page.dart';
import 'package:momeal_app/pages/product/list.dart';

class MenuPage extends GetView<CategoryController> {
  final void Function() backToHome;

  MenuPage({required this.backToHome});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.selectedCategory != null
        ? ProductListPage(
            title: controller.selectedCategory!.name,
            onBackTap: controller.unselectMenu,
            category: controller.selectedCategory!,
          )
        : AllPage(
            '모든 밀키트 메뉴', AllList.menus(controller.categories), backToHome));
  }
}
