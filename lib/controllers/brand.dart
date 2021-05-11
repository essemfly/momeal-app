import 'package:get/get.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/repos/brand.dart';

class BrandController extends GetxController {
  final _repo = BrandRepo();

  static BrandController to() => Get.find();

  final _brands = <Brand>[].obs;
  List<Brand> get brands => _brands.toList();

  final Rx<Brand?> _selectedBrand = Rx(null);
  Brand? get selectedBrand => _selectedBrand.value;

  void selectBrand(Brand brand) {
    _selectedBrand.value = brand;
  }

  void unselectBrand() {
    _selectedBrand.value = null;
  }

  @override
  void onInit() async {
    _brands.assignAll(await _repo.list());
    _selectedBrand.listen((Brand? brand) {
      print(brand == null ? 'Null' : brand.name);
    });
    super.onInit();
  }
}
