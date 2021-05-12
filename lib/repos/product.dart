import 'package:momeal_app/graphql/queries/products.data.gql.dart';
import 'package:momeal_app/graphql/queries/products.req.gql.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/models/product.dart';
import 'package:momeal_app/repos/base.dart';

class ProductRepo extends GraphQLRepo<Product, GProductsData_products> {
  Stream<List<Product>> listAll() {
    final req = GProductsReq(
      (builder) => builder
        ..vars.filter.offset = 0
        ..vars.filter.limit = 30,
    );
    return client
        .request(req)
        .map((event) => event.data?.products.map(parseData).toList() ?? []);
  }

  @override
  parseData(data) => Product(
      id: data.ID,
      name: data.name,
      thumbnail: data.imageurl,
      brand: Brand(name: data.brand?.name ?? "밀키트", thumbnail: ""),
      category: Category(name: "", thumbnail: ""),
      price: data.price.toDouble(),
      url: data.mallproducturl);
}
