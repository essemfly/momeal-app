import 'package:momeal_app/graphql/schema.schema.gql.dart';
import 'package:momeal_app/models/base.dart';

class Category implements Displayable {
  final GCategoryEnum name;
  final String label;
  final String thumbnail;
  final bool isOnMain;

  Category(
      {required this.isOnMain,
      required this.name,
      required this.label,
      required this.thumbnail});

  get displayName => label;
}
