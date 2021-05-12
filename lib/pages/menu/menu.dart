import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momeal_app/controllers/category.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/pages/common/all_list.dart';
import 'package:momeal_app/pages/common/all_page.dart';
import 'package:momeal_app/pages/product/list.dart';

class MenuPage extends GetView<CategoryController> {
  final void Function() backToHome;

  MenuPage({required this.backToHome});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.selected != null
        ? ProductListPage(
            title: controller.selected!.displayName,
            onBackTap: controller.unselect,
            category: controller.selected!,
          )
        : AllPage(
            '모든 밀키트 메뉴', AllList.make<Category>(controller.items), backToHome));
  }
}
