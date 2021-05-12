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
            ProductListPage(
              title: controller.selected?.displayName ?? "",
              onBackTap: controller.unselect,
              brand: controller.selected ?? Brand(name: "", thumbnail: ""),
            ),
          ],
          index: controller.selected == null ? 0 : 1,
        ));
  }
}
