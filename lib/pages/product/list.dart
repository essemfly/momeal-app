import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:momeal_app/helpers/aspect.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/models/product.dart';
import 'package:momeal_app/pages/common/page_with_topnav.dart';
import 'package:momeal_app/repos/product.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  ProductListItem(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(() => ProductWebView(product));
        canLaunch(product.url).then((result) {
          result
              ? launch(product.url)
              : throw 'Could not launch ${product.url}';
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product.thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(top: 5)),
          Text(
            '[${product.brand.name}] ${product.name}',
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            NumberFormat.decimalPattern().format(product.price) + '원',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final ProductRepo _repo = ProductRepo();
  final String title;
  final void Function() onBackTap;
  final RxList<Product> _products = RxList.empty();

  ProductListPage(
      {required this.title,
      required this.onBackTap,
      Category? category,
      Brand? brand}) {
    _repo.list(category: category, brand: brand).then((products) {
      print(products);
      _products.assignAll(products);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWithTopNav(
      title: title,
      child: Obx(() => GridView.count(
            padding: EdgeInsets.zero,
            childAspectRatio:
                getAspectRatio(desiredHeight: 240, context: context),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: _products
                .map((p) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: ProductListItem(p),
                    ))
                .toList(),
          )),
      onBackTap: onBackTap,
    );
  }
}
