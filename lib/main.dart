import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:momeal_app/pages/brand/brand.dart';
import 'package:momeal_app/pages/home/home.dart';
import 'package:momeal_app/pages/loading/loading.dart';
import 'package:momeal_app/pages/category/category.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:momeal_app/repos/brand.dart';
import 'package:momeal_app/repos/category.dart';
import 'package:momeal_app/services/analytics.dart';
import 'package:stream_transform/stream_transform.dart';

import 'controllers/brand.dart';
import 'controllers/category.dart';
import 'models/brand.dart';
import 'models/category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final graphqlLink = HttpLink(
      'http://ec2-15-164-166-129.ap-northeast-2.compute.amazonaws.com:8080/query');
  Get.put(Client(link: graphqlLink));

  Get.put(AnalyticsService());

  Get.put(CategoryController(CategoryRepo()));
  Get.put(BrandController(BrandRepo()));
  runApp(App());
}

Future<bool> _exitApp(BuildContext context) async {
  return await showDialog<bool?>(
        context: context,
        builder: (b) => AlertDialog(
          title: Text('앱 종료'),
          content: Text('정말 종료하시겠어요...? :('),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('아니오'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('예'),
            ),
          ],
        ),
      ) ??
      false;
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '모밀',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AppHome(),
    );
  }
}

class AppHome extends StatelessWidget {
  final RxInt _navIndex = 0.obs;
  int get navIndex => _navIndex.value;
  final RxBool _isReady = false.obs;
  bool get isReady => _isReady.value;

  final CategoryController _categoryController = CategoryController.to();
  final BrandController _brandController = BrandController.to();

  Future<bool> _onWillPop(BuildContext context) async {
    switch (_navIndex.value) {
      // Category
      case 1:
        _navIndex.value = _categoryController.isSelected ? 1 : 0;
        _categoryController.unselect();
        return false;
      // Brand
      case 2:
        _navIndex.value = _brandController.isSelected ? 1 : 0;
        _brandController.unselect();
        return false;
      // Home & others
      default:
        return await _exitApp(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final readyStream = _categoryController.itemsStream.combineLatest(
        _brandController.itemsStream, (List<Category>? c, List<Brand>? b) {
      if (c == null || b == null) return false;
      return c.length > 0 && b.length > 0;
    });

    _isReady.bindStream(readyStream);

    List<Widget> _pages = [
      HomePage((int index) => _navIndex.value = index),
      CategoryPage(backToHome: () => _navIndex.value = 0),
      BrandPage(backToHome: () => _navIndex.value = 0)
    ];

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Obx(() => !isReady
          ? const LoadingPage()
          : Scaffold(
              appBar: null,
              body: IndexedStack(
                children: _pages,
                index: navIndex,
              ),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey.shade500,
                iconSize: 28,
                currentIndex: navIndex,
                onTap: (int newIndex) {
                  _categoryController.unselect();
                  _brandController.unselect();
                  _navIndex.value = newIndex;
                },
                items: [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: '홈'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.menu), label: '메뉴'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.card_giftcard), label: '브랜드'),
                ],
              ),
            )),
    );
  }
}
