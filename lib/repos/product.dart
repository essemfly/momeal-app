import 'package:momeal_app/graphql/queries/products.data.gql.dart';
import 'package:momeal_app/graphql/queries/products.req.gql.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/models/product.dart';
import 'package:momeal_app/repos/base.dart';

class ProductRepo extends GraphQLRepo<Product, GProductsData_products> {
  Stream<List<Product>> listAll(
      {Brand? brand,
      Category? category,
      int? offset,
      int? limit,
      String? searchKeyword}) {
    final req = GProductsReq((builder) {
      builder
        ..vars.filter.offset = offset ?? 0
        ..vars.filter.limit = limit ?? 100;
      if (brand != null) {
        builder.vars.filter.brand = brand.ID;
      } else if (category != null) {
        builder.vars.filter.category = category.name;
      }
      builder.vars.filter.search = searchKeyword ?? "";
    });
    return client
        .request(req)
        .map((event) => event.data?.products.map(parseData).toList() ?? []);
  }

  @override
  parseData(data) {
    return Product(
        id: data.ID,
        name: data.name,
        thumbnail: data.imageurl,
        brand: Brand(
            ID: data.brand.ID,
            isOnMain: data.brand.onmain,
            name: data.brand.name,
            thumbnail: data.brand.brandimageurl),
        category: Category(
            isOnMain: data.category.onmain,
            label: data.category.label,
            name: data.category.name,
            thumbnail: data.category.categoryimageurl),
        price: data.price.toDouble(),
        url: data.producturl);
  }
}
