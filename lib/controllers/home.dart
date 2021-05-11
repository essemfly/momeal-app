import 'package:get/get.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/repos/brand.dart';
import 'package:momeal_app/repos/category.dart';

class HomeController extends GetxController {
  final _categoryRepo = CategoryRepo();
  final _brandRepo = BrandRepo();

  static HomeController to() => Get.find();

  final _categories = <Category>[].obs;
  List<Category> get categories => _categories.toList();

  final _brands = <Brand>[].obs;
  List<Brand> get brands => _brands.toList();

  @override
  void onInit() async {
    _categories
        .bindStream(_categoryRepo.listAll().map((c) => c.take(15).toList()));
    _brands.bindStream(_brandRepo.listAll().map((b) => b.take(3).toList()));
    super.onInit();
  }
}
