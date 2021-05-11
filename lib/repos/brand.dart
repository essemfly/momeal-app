import 'package:momeal_app/models/brand.dart';

class BrandRepo {
  final List<Brand> _mockData = [
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
    Brand(id: '1', name: '프레시지', thumbnail: 'assets/notice.png'),
  ];

  Future<List<Brand>> list() async {
    return _mockData;
  }
}
