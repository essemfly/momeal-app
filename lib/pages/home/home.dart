import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:momeal_app/constants.dart';
import 'package:momeal_app/controllers/base.dart';
import 'package:momeal_app/controllers/brand.dart';
import 'package:momeal_app/controllers/category.dart';
import 'package:momeal_app/helpers/controllers.dart';
import 'package:momeal_app/models/base.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/pages/home/components/icon.dart';
import 'package:momeal_app/pages/home/components/notice.dart';
import 'package:momeal_app/services/analytics.dart';

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

ClickableButtonType _getIconTypeEnum<T>(bool isMore) {
  if (T == Brand) {
    return isMore ? ClickableButtonType.BRAND_MORE : ClickableButtonType.BRAND;
  } else {
    return isMore
        ? ClickableButtonType.CATEGORY_MORE
        : ClickableButtonType.CATEGORY;
  }
}

int _getNavIndex<T>() {
  if (T == Brand) {
    return 3;
  } else {
    return 2;
  }
}

class HomePage extends StatelessWidget {
  final void Function(int index) _navigateToIndex;
  final _analytics = AnalyticsService.to();

  final _categoryController = CategoryController.to();
  final _brandController = BrandController.to();

  HomePage(this._navigateToIndex);

  VoidCallback _iconHandlerFactory<T extends Displayable>(
      {T? item, bool isMore = false}) {
    ClickableButtonType iconClickType = _getIconTypeEnum<T>(isMore);
    return () {
      _analytics.logIconClicked(iconClickType, PageType.HOME,
          payload: {"name": item?.displayName});
      final BaseController controller = getController<T>();
      isMore ? controller.unselect() : controller.select(item!);
      _navigateToIndex(_getNavIndex<T>());
    };
  }

  List<HomeIcon>
      _iconFactory<T extends Displayable, C extends BaseController<T, dynamic>>(
          List<T> items) {
    List<HomeIcon> icons = [];
    icons.addAll(items
        .map((e) => HomeIcon.item(
            e.displayName, e.thumbnail, _iconHandlerFactory<T>(item: e)))
        .toList());
    icons.add(HomeIcon.more(_iconHandlerFactory<T>(isMore: true)));
    return icons;
  }

  List<HomeIcon> get categoryIcons =>
      _iconFactory<Category, CategoryController>(_categoryController.homeItems);

  List<HomeIcon> get brandIcons =>
      _iconFactory<Brand, BrandController>(_brandController.homeItems);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20,
              bottom: 25,
            ),
            child: Image.asset(
              AssetImages.bi,
              height: 35,
            ),
          ),
          HomeNotice(_brandController.items.length),
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
