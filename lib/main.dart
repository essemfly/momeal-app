import 'package:flutter/material.dart';
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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _navIndex = 0;
  bool _isReady = false;
  CategoryController _categoryController = CategoryController.to();
  BrandController _brandController = BrandController.to();

  @override
  Widget build(BuildContext context) {
    final readyStream = _categoryController.itemsStream.combineLatest(
        _brandController.itemsStream, (List<Category>? c, List<Brand>? b) {
      if (c == null || b == null) return false;
      return c.length > 0 && b.length > 0;
    });

    readyStream.listen((isReady) {
      setState(() {
        _isReady = isReady;
      });
    });

    List<Widget> _pages = [
      HomePage((int index) {
        setState(() {
          _navIndex = index;
        });
      }),
      CategoryPage(
        backToHome: () {
          setState(() {
            _navIndex = 0;
          });
        },
      ),
      BrandPage(
        backToHome: () {
          setState(() {
            _navIndex = 0;
          });
        },
      )
    ];

    return GetMaterialApp(
      title: '모밀',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: !_isReady
          ? LoadingPage()
          : Scaffold(
              appBar: null,
              body: IndexedStack(
                children: _pages,
                index: _navIndex,
              ),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey.shade500,
                iconSize: 28,
                currentIndex: _navIndex,
                onTap: (int newIndex) {
                  _categoryController.unselect();
                  _brandController.unselect();
                  setState(() {
                    _navIndex = newIndex;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: '홈'),
                  BottomNavigationBarItem(icon: Icon(Icons.menu), label: '메뉴'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.card_giftcard), label: '브랜드'),
                ],
              ),
            ),
    );
  }
}
