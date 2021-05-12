import 'package:momeal_app/models/base.dart';

class Brand implements Displayable {
  final String name;
  final String thumbnail;

  Brand({required this.name, required this.thumbnail});

  get displayName => name;
}
