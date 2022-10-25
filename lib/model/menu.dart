import 'package:flutter/cupertino.dart';

class Menu extends ChangeNotifier {
  final String menuId, menuName, menuDesc, menuImg;
  final int menuPrice;
  final bool isPackage;

  Menu({
    required this.menuId,
    required this.menuName,
    required this.menuDesc,
    required this.menuImg,
    required this.menuPrice,
    required this.isPackage,
  });
}
