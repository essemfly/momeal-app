import 'package:momeal_app/models/base.dart';

class Category implements Displayable {
  final String name;
  final String label;
  final String thumbnail;

  Category({required this.name, required this.label, required this.thumbnail});

  get displayName => label;
}
