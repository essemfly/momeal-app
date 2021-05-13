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
import 'package:fluttertoast/fluttertoast.dart';

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
  final Rx<DateTime?> _lastExitAttemptAt = Rx<DateTime?>(null);
  Duration get _exitAttemptInterval => _lastExitAttemptAt.value != null
      ? DateTime.now().difference(_lastExitAttemptAt.value!)
      : const Duration(days: 1);

  final CategoryController _categoryController = CategoryController.to();
  final BrandController _brandController = BrandController.to();

  final _fToast = FToast();

  _showToast(BuildContext context) {
    _fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: const Color(0xe60D243B),
      ),
      child: const Text(
        "'뒤로' 버튼을 한 번 더 누르면 앱이 종료됩니다.",
        style: const TextStyle(color: Colors.white),
      ),
    );

    _fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

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
        if (_exitAttemptInterval <= const Duration(seconds: 2)) {
          return true;
        }

        _lastExitAttemptAt.value = DateTime.now();
        _showToast(context);
        return false;
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
