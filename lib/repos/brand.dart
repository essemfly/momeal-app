import 'package:momeal_app/graphql/queries/brands.data.gql.dart';
import 'package:momeal_app/graphql/queries/brands.req.gql.dart';
import 'package:momeal_app/models/brand.dart';
import 'package:momeal_app/repos/base.dart';

class BrandRepo extends GraphQLRepo<Brand, GBrandsData_brands> {
  Stream<List<Brand>> listAll() {
    final req = GBrandsReq();
    final stream = client.request(req);
    return stream
        .map((event) => event.data?.brands.map(parseData).toList() ?? []);
  }

  @override
  Brand parseData(GBrandsData_brands data) => Brand(
      name: data.name.toString(),
      thumbnail: data.brandimageurl == ""
          ? "https://mealkit.s3.ap-northeast-2.amazonaws.com/brands/momil.png"
          : data.brandimageurl);
}
