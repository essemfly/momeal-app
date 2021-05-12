import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:momeal_app/controllers/brand.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/pages/common/all_list.dart';
import 'package:momeal_app/pages/common/all_page.dart';
import 'package:momeal_app/pages/product/list.dart';

class BrandPage extends StatefulWidget {
  final void Function() backToHome;
  final controller = BrandController.to();
  BrandPage({required this.backToHome});

  @override
  _BrandPageState createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  int _inPageNavIndex = 0;
  @override
  void initState() {
    widget.controller.selectedStream.listen((Brand? b) {
      setState(() {
        _inPageNavIndex = b == null ? 0 : 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: [
        AllPage('모든 밀키트 브랜드', AllList.make<Brand>(widget.controller.items),
            widget.backToHome),
        Obx(() => ProductListPage(
              title: widget.controller.selected?.displayName ?? "",
              onBackTap: widget.controller.unselect,
              brand:
                  widget.controller.selected ?? Brand(name: "", thumbnail: ""),
            )),
      ],
      index: _inPageNavIndex,
    );
  }
}
