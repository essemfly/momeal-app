import 'package:momeal_app/graphql/queries/categories.req.gql.dart';
import 'package:momeal_app/graphql/queries/categories.data.gql.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/repos/base.dart';

class CategoryRepo extends GraphQLRepo<Category, GCategoriesData_categories> {
  Stream<List<Category>> listAll() {
    final req = GCategoriesReq();
    return client
        .request(req)
        .map((event) => event.data?.categories.map(parseData).toList() ?? []);
  }

  @override
  Category parseData(GCategoriesData_categories data) => Category(
      isOnMain: data.onmain,
      name: data.name,
      label: data.label,
      thumbnail: data.categoryimageurl != ""
          ? data.categoryimageurl
          : "https://mealkit.s3.ap-northeast-2.amazonaws.com/brands/momil.png");
}
