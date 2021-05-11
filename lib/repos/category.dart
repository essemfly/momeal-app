import 'package:momeal_app/models/category.dart';

class CategoryRepo {
  final List<Category> _mockData = [
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
    Category(id: '1', name: '찌개', thumbnail: 'assets/bi.png'),
  ];

  Future<List<Category>> list() async {
    return _mockData;
  }
}
