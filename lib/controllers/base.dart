import 'package:get/get.dart';
import 'package:momeal_app/repos/base.dart';

abstract class BaseController<T, R extends GraphQLRepo<T, dynamic>>
    extends GetxController {
  final R _repo;
  static BaseController to() => Get.find();

  BaseController(this._repo);

  final RxList<T> _items = <T>[].obs;
  Stream<List<T>?> get itemsStream => _items.stream;
  List<T> get items => _items.toList();

  final Rx<T?> _selected = Rx(null);
  Stream<T?> get selectedStream => _selected.stream;
  T? get selected => _selected.value;
  bool get isSelected => _selected.value != null;

  void select(T item) {
    _selected.value = item;
  }

  void unselect() {
    _selected.value = null;
  }

  @override
  void onInit() async {
    _items.bindStream(_repo.listAll());
    super.onInit();
  }
}
