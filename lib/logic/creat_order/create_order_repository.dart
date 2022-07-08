import 'package:zakazpro/model/creat_order.dart';
import 'package:zakazpro/model/create_order_model.dart';

abstract class CreateOrderRepository {
  Future<Createorder> createorder(CreateOrderModel createOrderModel);
}
