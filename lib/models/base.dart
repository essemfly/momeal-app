abstract class Displayable {
  final String thumbnail;
  final bool isOnMain;
  Displayable(this.thumbnail, this.isOnMain);

  String get displayName;
}
