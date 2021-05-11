import 'brand.dart';
import 'category.dart';
import 'package:meta/meta.dart';

class Product {
  final String id;
  final String name;
  final String thumbnail;
  final Brand brand;
  final Category category;
  final double price;
  final String url;

  Product(
      {required this.id,
      required this.name,
      required this.thumbnail,
      required this.brand,
      required this.category,
      required this.price,
      required this.url});
}
