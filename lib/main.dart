import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:momeal_app/controllers/search.dart';
import 'package:momeal_app/pages/brand/brand.dart';
import 'package:momeal_app/pages/home/home.dart';
import 'package:momeal_app/pages/loading/loading.dart';
import 'package:momeal_app/pages/category/category.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:momeal_app/pages/search/search.dart';
import 'package:momeal_app/repos/brand.dart';
import 'package:momeal_app/repos/category.dart';
import 'package:momeal_app/services/analytics.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'controllers/brand.dart';
import 'controllers/category.dart';
import 'helpers/toast.dart';
import 'models/brand.dart';
import 'models/category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final graphqlLink = HttpLink('https://mealkit.lessbutter.co/query');
  Get.put(Client(link: graphqlLink));

  Get.put(AnalyticsService());

  Get.put(CategoryController(CategoryRepo()));
  Get.put(BrandController(BrandRepo()));
  Get.put(SearchController());
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
        fontFamily: 'SpoqaHanSansNeo',
      ),
      home: AppHome(),
    );
  }
}

class AppHome extends StatelessWidget {
  final RxInt _navIndex = 0.obs;
  int get navIndex => _navIndex.value;
  final Rx<DateTime?> _lastExitAttemptAt = Rx<DateTime?>(null);
  Duration get _exitAttemptInterval => _lastExitAttemptAt.value != null
      ? DateTime.now().difference(_lastExitAttemptAt.value!)
      : const Duration(days: 1);

  final CategoryController _categoryController = CategoryController.to();
  final BrandController _brandController = BrandController.to();
  final SearchController _searchController = SearchController.to();
  final RxBool _isReady = false.obs;
  bool get isReady => _isReady.value;

  final _fToast = FToast();

  AppHome() {
    final readyStream = _categoryController.itemsStream.combineLatest(
        _brandController.itemsStream, (List<Category>? c, List<Brand>? b) {
      if (c == null || b == null) return false;
      return c.length > 0 && b.length > 0;
    });
    _isReady.value = _categoryController.items.length > 0 &&
        _brandController.items.length > 0;
    _isReady.bindStream(readyStream);
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
        showToast(
            fToast: _fToast,
            context: context,
            body: "'뒤로' 버튼을 한 번 더 누르면 앱이 종료됩니다.");
        return false;
    }
  }

  _backToHome() => _navIndex.value = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      HomePage((int index) => _navIndex.value = index),
      SearchPage(backToHome: () {
        _searchController.reset();
        _backToHome();
      }),
      CategoryPage(backToHome: _backToHome),
      BrandPage(backToHome: _backToHome)
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
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey.shade500,
                iconSize: 28,
                currentIndex: navIndex,
                onTap: (int newIndex) {
                  _categoryController.unselect();
                  _brandController.unselect();
                  _searchController.reset();
                  _navIndex.value = newIndex;
                },
                items: [
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: '홈'),
                  const BottomNavigationBarItem(
                      icon: Icon(Icons.search_outlined), label: '검색'),
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
