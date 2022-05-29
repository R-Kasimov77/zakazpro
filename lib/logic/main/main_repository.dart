import 'package:zakazpro/model/order.dart';

abstract class MainRepository {
  Future<Order> main();
}
