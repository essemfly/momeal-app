import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:momeal_app/controllers/brand.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/pages/common/all_list.dart';
import 'package:momeal_app/pages/common/all_page.dart';
import 'package:momeal_app/pages/product/list.dart';

class BrandPage extends StatelessWidget {
  final void Function() backToHome;
  final controller = BrandController.to();

  BrandPage({required this.backToHome});

  @override
  Widget build(BuildContext context) {
    return Obx(() => IndexedStack(
          children: [
            AllPage('모든 밀키트 브랜드', AllList.make<Brand>(controller.items),
                backToHome),
            controller.isSelected
                ? ProductListPage(
                    title: controller.selected!.displayName,
                    onBackTap: controller.unselect,
                    brand: controller.selected!,
                    onlyList: false,
                  )
                : Container(),
          ],
          index: controller.isSelected ? 1 : 0,
        ));
  }
}
