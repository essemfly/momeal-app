import 'package:momeal_app/models/base.dart';

class Brand implements Displayable {
  // ignore: non_constant_identifier_names
  final String ID;
  final String name;
  final String thumbnail;
  final bool isOnMain;

  // ignore: non_constant_identifier_names
  Brand(
      {required this.isOnMain,
      required this.ID,
      required this.name,
      required this.thumbnail});

  get displayName => name;
}
