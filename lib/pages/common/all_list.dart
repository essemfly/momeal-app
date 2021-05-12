import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:momeal_app/controllers/base.dart';
import 'package:momeal_app/helpers/aspect.dart';
import 'package:momeal_app/helpers/controllers.dart';
import 'package:momeal_app/models/base.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/services/analytics.dart';

const double ICON_SIZE = 40;

class Item<ListItem extends Displayable> extends StatelessWidget {
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
            padding: const EdgeInsets.only(left: 20, right: 5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: ICON_SIZE - 5,
                  width: ICON_SIZE - 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
                Container(
                  height: ICON_SIZE,
                  width: ICON_SIZE,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(listItem.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                listItem.displayName,
                style: const TextStyle(fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_getPageType<T extends Displayable>() =>
    T == Brand ? PageType.BRANDS : PageType.CATEGORIES;
_getButtonType<T extends Displayable>() =>
    T == Brand ? ClickableButtonType.BRAND : ClickableButtonType.CATEGORY;

class AllList<T extends Displayable> extends StatelessWidget {
  final List<Item> items;
  AllList(this.items);

  static make<R extends Displayable>(List<R> items) {
    BaseController controller = getController<R>();
    final AnalyticsService _analytics = AnalyticsService.to();

    return AllList(items
        .map((item) => Item(
            listItem: item,
            onTap: () {
              _analytics.logIconClicked(_getButtonType<R>(), _getPageType<R>(),
                  payload: {"name": item.displayName});
              controller.select(item);
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
