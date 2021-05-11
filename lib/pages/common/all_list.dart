import 'package:flutter/material.dart';
import 'package:momeal_app/controllers/brand.dart';
import 'package:momeal_app/controllers/category.dart';
import 'package:momeal_app/helpers/aspect.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/models/category.dart';

const double ICON_SIZE = 40;

class ListItem {
  final String thumbnail;
  final String label;

  ListItem({required this.thumbnail, required this.label});
}

class Item extends StatelessWidget {
  final ListItem listItem;
  final void Function() onTap;
  Item({required this.listItem, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: ICON_SIZE,
              width: ICON_SIZE,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(listItem.thumbnail),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            listItem.label,
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}

class AllList extends StatelessWidget {
  final List<Item> items;

  AllList(this.items);

  static menus(List<Category> categories) {
    CategoryController controller = CategoryController.to();

    return AllList(categories
        .map((menu) => Item(
            listItem: ListItem(thumbnail: menu.thumbnail, label: menu.name),
            onTap: () {
              controller.selectMenu(menu);
            }))
        .toList());
  }

  static brands(List<Brand> brands) {
    BrandController controller = BrandController.to();
    return AllList(brands
        .map((brand) => Item(
            listItem: ListItem(thumbnail: brand.thumbnail, label: brand.name),
            onTap: () {
              controller.selectBrand(brand);
            }))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(0),
      crossAxisCount: 2,
      childAspectRatio: getAspectRatio(desiredHeight: 60, context: context),
      children: items,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
