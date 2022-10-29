import 'package:mini_project/model/menu.dart';

class Order extends Menu {
  final String orderId, orderAddress, orderDate;
  final String? userNote;
  final int totalOrder;
  int? totalPrice;

  Order({
    required this.orderId,
    required this.totalOrder,
    required this.orderAddress,
    required this.orderDate,
    this.userNote,
    required super.menuId,
    required super.menuName,
    required super.menuDesc,
    required super.menuImg,
    required super.menuPrice,
    required super.isPackage,
    this.totalPrice,
  });
}
