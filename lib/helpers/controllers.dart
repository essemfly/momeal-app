import 'package:momeal_app/controllers/brand.dart';
import 'package:momeal_app/controllers/category.dart';
import 'package:momeal_app/models/category.dart';

getController<T>() {
  if (T == Category)
    return CategoryController.to();
  else
    return BrandController.to();
}
