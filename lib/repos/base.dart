import 'package:ferry/ferry.dart';
import 'package:get/instance_manager.dart';

abstract class GraphQLRepo<DomainType, DtoType> {
  final Client client = Get.find();

  DomainType parseData(DtoType data);
}
