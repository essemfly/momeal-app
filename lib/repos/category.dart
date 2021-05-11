import 'package:momeal_app/graphql/queries/categories.req.gql.dart';
import 'package:momeal_app/graphql/queries/categories.data.gql.dart';
import 'package:momeal_app/models/category.dart';
import 'package:momeal_app/repos/base.dart';

const categoryEnumMap = {
  "Hamultang": "해물탕",
  "Yukgyejang": "육개장",
  "Maratang": "마라탕",
  "Duonjangzzigye": "된장찌개",
  "Kimchizzigye": "김치찌개",
  "Gambas": "감바스",
  "Etcjeongol": "기타 국/탕/전골",
  "Steak": "스테이크",
  "Gogi": "고기",
  "Umooktang": "어묵탕",
  "Churtang": "추어탕",
  "Bibbimbap": "덮밥/비빔밥",
  "Gobchangjeongol": "곱창전골",
  "Chunggukjang": "청국장",
  "Budaezzigye": "부대찌개",
  "Etc": "기타 요리",
  "Altang": "알탕",
  "Myun": "면",
  "Millefeuille": "밀푀유나베",
  "Uguzytang": "우거지탕",
  "Bunsik": "분식",
  "Pasta": "파스타",
  "Sundubuzzigye": "순두부찌개",
  "Kongbeasyzzigye": "콩비지찌개",
};

class CategoryRepo extends GraphQLRepo<Category, GCategoriesData_categories> {
  Stream<List<Category>> listAll() {
    final req = GCategoriesReq();
    return client
        .request(req)
        .map((event) => event.data?.categories.map(parseData).toList() ?? []);
  }

  @override
  Category parseData(GCategoriesData_categories data) => Category(
      name: categoryEnumMap[data.name.toString()] ?? "기타",
      thumbnail: data.categoryimageurl);
}
