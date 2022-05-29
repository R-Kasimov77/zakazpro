import 'package:zakazpro/model/order.dart';

class DetailScreenArguments {
  final int index;
  final Order order;
  final List<Responses> responses;

  DetailScreenArguments({
    required this.index,
    required this.order,
    required this.responses,
  });
}
