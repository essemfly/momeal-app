import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:momeal_app/controllers/brand.dart';
import 'package:momeal_app/pages/common/all_list.dart';
import 'package:momeal_app/pages/common/all_page.dart';
import 'package:momeal_app/pages/product/list.dart';

class BrandPage extends GetView<BrandController> {
  final void Function() backToHome;

  BrandPage({required this.backToHome});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.selectedBrand != null
        ? ProductListPage(
            title: controller.selectedBrand!.name,
            onBackTap: controller.unselectBrand,
            brand: controller.selectedBrand!,
          )
        : AllPage('모든 밀키트 브랜드', AllList.brands(controller.brands), backToHome));
  }
}
