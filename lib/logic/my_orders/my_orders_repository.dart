import 'package:zakazpro/model/order.dart';

abstract class MyOrdersRepository {
  Future<Order> myOrders();
}
