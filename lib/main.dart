import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:momeal_app/controllers/home.dart';
import 'package:momeal_app/pages/brand/brand.dart';
import 'package:momeal_app/pages/home/home.dart';
import 'package:momeal_app/pages/menu/menu.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:momeal_app/repos/brand.dart';
import 'package:momeal_app/repos/category.dart';
import 'package:momeal_app/services/analytics.dart';

import 'controllers/brand.dart';
import 'controllers/category.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final graphqlLink = HttpLink(
      'http://ec2-15-164-166-129.ap-northeast-2.compute.amazonaws.com:8080/query');
  Get.put(Client(link: graphqlLink));

  Get.put(AnalyticsService(FirebaseAnalytics()));

  Get.put(HomeController());
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
  CategoryController _categoryController = CategoryController.to();
  BrandController _brandController = BrandController.to();

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      HomePage((int index) {
        setState(() {
          _navIndex = index;
        });
      }),
      MenuPage(
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
      home: Scaffold(
        appBar: null,
        body: _pages[_navIndex],
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
