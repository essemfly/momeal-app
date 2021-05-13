import 'package:get/get.dart';
import 'package:momeal_app/controllers/base.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/repos/brand.dart';

class BrandController extends BaseController<Brand, BrandRepo> {
  static BrandController to() => Get.find();

  BrandController(BrandRepo repo) : super(repo);

  get homeItems => items.where((element) => element.isOnMain).toList();
}
