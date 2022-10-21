import 'package:mini_project/model/menu.dart';

class Order extends Menu {
  final String orderId;
  final String? userNote;
  final int totalOrder;
  List<Menu> menuData = menuList;

  Order({
    required this.orderId,
    required this.totalOrder,
    this.userNote,
    required super.menuId,
    required super.menuName,
    required super.menuDesc,
    required super.menuImg,
    required super.menuPrice,
    required super.isPackage,
  });
}

List<Order> listOrder = [
  Order(
    orderId: 'order-1',
    totalOrder: 50,
    menuId: menuList[1].menuId,
    menuName: menuList[1].menuName,
    menuDesc: menuList[1].menuDesc,
    menuImg: menuList[1].menuImg,
    menuPrice: menuList[1].menuPrice,
    isPackage: menuList[1].isPackage,
  ),
  Order(
    orderId: 'order-2',
    totalOrder: 50,
    menuId: menuList[2].menuId,
    menuName: menuList[2].menuName,
    menuDesc: menuList[2].menuDesc,
    menuImg: menuList[2].menuImg,
    menuPrice: menuList[2].menuPrice,
    isPackage: menuList[2].isPackage,
  ),
  Order(
    orderId: 'order-3',
    totalOrder: 70,
    menuId: menuList[0].menuId,
    menuName: menuList[0].menuName,
    menuDesc: menuList[0].menuDesc,
    menuImg: menuList[0].menuImg,
    menuPrice: menuList[0].menuPrice,
    isPackage: menuList[0].isPackage,
  ),
];
