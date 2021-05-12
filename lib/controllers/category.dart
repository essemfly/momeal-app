import 'package:get/get.dart';
import 'package:momeal_app/controllers/base.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/repos/category.dart';

class CategoryController extends BaseController<Category, CategoryRepo> {
  static CategoryController to() => Get.find();

  CategoryController(CategoryRepo repo) : super(repo);

  get homeItems => items.take(15).toList();
}
