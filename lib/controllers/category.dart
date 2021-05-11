import 'package:get/get.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/repos/category.dart';

class CategoryController extends GetxController {
  final _categoryRepo = CategoryRepo();

  static CategoryController to() => Get.find();

  final _categories = <Category>[].obs;
  List<Category> get categories => _categories.toList();

  final Rx<Category?> _selectedCategory = Rx(null);
  Category? get selectedCategory => _selectedCategory.value;

  void selectMenu(Category category) {
    _selectedCategory.value = category;
  }

  void unselectMenu() {
    _selectedCategory.value = null;
  }

  @override
  void onInit() async {
    _categories.assignAll(await _categoryRepo.list());
    _selectedCategory.listen((Category? category) {
      print(category == null ? 'Null' : category.name);
    });
    super.onInit();
  }
}
