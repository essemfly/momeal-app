import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:momeal_app/constants.dart';
import 'package:momeal_app/helpers/aspect.dart';
import 'package:momeal_app/helpers/dialog.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/models/product.dart';
import 'package:momeal_app/pages/common/page_with_topnav.dart';
import 'package:momeal_app/repos/product.dart';
import 'package:momeal_app/services/analytics.dart';
import 'package:url_launcher/url_launcher.dart';

String _getAlternateUrl(Product p) =>
    Uri.encodeFull("https://search.naver.com/search.naver?query=${p.name}");

class ProductListItem extends StatelessWidget {
  final Product product;
  final AnalyticsService analytics;
  ProductListItem(this.product, {required this.analytics});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        analytics.logIconClicked(ClickableButtonType.PRODUCT, PageType.PRODUCTS,
            payload: {
              "id": product.id,
              "name": product.name,
              "url": product.url,
              "brandName": product.brand.name,
              "category": product.category.name,
              "price": product.price,
            });

        if (await canLaunch(product.url)) {
          launch(product.url);
          return;
        }

        final alternateUrl = _getAlternateUrl(product);
        if (await canLaunch(alternateUrl)) {
          launch(alternateUrl);
          return;
        }

        showAlertDialog(context, "오류", "상품 정보에 오류가 있습니다.");
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.thumbnail,
              imageBuilder: (ctx, imageProvider) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              errorWidget: (ctx, url, error) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetImages.product_fallback),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
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
  final String title;
  final void Function() onBackTap;
  final ProductRepo _repo = ProductRepo();
  final _analytics = AnalyticsService.to();
  static const _pageSize = 20;

  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0);

  ProductListPage(
      {required this.title,
      required this.onBackTap,
      Category? category,
      Brand? brand}) {
    _pagingController.addPageRequestListener((pageKey) async {
      final newItems = await (_repo
          .listAll(
              category: category,
              brand: brand,
              limit: _pageSize,
              offset: pageKey)
          .first);

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageWithTopNav(
      title: title,
      child: PagedGridView<int, Product>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate(
            noItemsFoundIndicatorBuilder: (ctx) => Center(
                  child: const Text("조건을 만족하는 상품이 없어요 😭"),
                ),
            itemBuilder: (ctx, item, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ProductListItem(item, analytics: _analytics),
                )),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              getAspectRatio(desiredHeight: 240, context: context),
        ),
      ),
      onBackTap: onBackTap,
      scrollable: false,
    );
  }
}
