import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:momeal_app/controllers/brand.dart';
import 'package:momeal_app/controllers/category.dart';
import 'package:momeal_app/controllers/home.dart';
import 'package:momeal_app/pages/home/components/icon.dart';
import 'package:momeal_app/pages/home/components/notice.dart';

const LOGO_PATH = 'assets/bi.png';

const SECTION_TITLE_MENU = '메뉴 모두모아';
const SECTION_TITLE_BRAND = '브랜드 모두모아';

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}

class HomePage extends GetView<HomeController> {
  final void Function(int index) _navigateToIndex;

  HomePage(this._navigateToIndex);

  List<HomeIcon> get categoryIcons {
    List<HomeIcon> icons = [];
    icons.addAll(controller.categories
        .map((e) => HomeIcon.rounded(e.name, e.thumbnail, () {
              final controller = CategoryController.to();
              controller.selectMenu(e);
              _navigateToIndex(1);
            }))
        .toList());
    icons.add(HomeIcon.more(() {
      final controller = CategoryController.to();
      controller.unselectMenu();
      _navigateToIndex(1);
    }));
    return icons;
  }

  List<HomeIcon> get brandIcons {
    List<HomeIcon> icons = [];
    icons.addAll(controller.brands
        .map((e) => HomeIcon.circular(e.name, e.thumbnail, () {
              final controller = BrandController.to();
              controller.selectBrand(e);
              _navigateToIndex(2);
            }))
        .toList());
    icons.add(HomeIcon.more(() {
      final controller = BrandController.to();
      controller.unselectBrand();
      _navigateToIndex(2);
    }));
    return icons;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              bottom: 20,
            ),
            child: Image.asset(
              LOGO_PATH,
              height: 35,
            ),
          ),
          HomeNotice(),
          Row(
            children: [
              SectionTitle(SECTION_TITLE_MENU),
            ],
          ),
          Obx(() => GridView.count(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true, // Why?
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: categoryIcons,
              )),
          Container(
            height: 20,
            decoration: BoxDecoration(color: const Color(0xffF5F7FF)),
          ),
          Row(
            children: [
              SectionTitle(SECTION_TITLE_BRAND),
            ],
          ),
          Obx(() => GridView.count(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true, // Why?
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: brandIcons,
              )),
        ],
      ),
    );
  }
}
