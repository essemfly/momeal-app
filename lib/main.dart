import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:momeal_app/controllers/home.dart';
import 'package:momeal_app/pages/brand/brand.dart';
import 'package:momeal_app/pages/home/home.dart';
import 'package:momeal_app/pages/menu/menu.dart';

import 'controllers/brand.dart';
import 'controllers/category.dart';

void main() {
  Get.put(HomeController());
  Get.put(CategoryController());
  Get.put(BrandController());
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
            _categoryController.unselectMenu();
            _brandController.unselectBrand();
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
