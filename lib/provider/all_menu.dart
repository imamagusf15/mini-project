import 'package:flutter/cupertino.dart';
import 'package:mini_project/model/menu.dart';

class ListMenu with ChangeNotifier {
  List<Menu> menuList = [
    Menu(
      menuId: 'menu-1',
      menuName: 'Paket A',
      menuDesc:
          'Nasi putih, sayur capcay, ayam goreng, telur balado, kentang balado ati sapi',
      menuImg: 'asset/nasipaketA.jpg',
      menuPrice: 22000,
      isPackage: true,
    ),
    Menu(
      menuId: 'menu-2',
      menuName: 'Paket B',
      menuDesc:
          'Nasi putih, sayur buncis, ayam goreng, telur balado, mie goreng',
      menuImg: 'asset/nasipaketB.png',
      menuPrice: 20000,
      isPackage: true,
    ),
    Menu(
      menuId: 'menu-3',
      menuName: 'Paket C',
      menuDesc: 'Nasi kuning, orek tempe, telur balado, bihun goreng',
      menuImg: 'asset/nasipaketC.png',
      menuPrice: 14000,
      isPackage: true,
    ),
    Menu(
      menuId: 'menu-4',
      menuName: 'Lontong Isi',
      menuDesc: '',
      menuImg: 'asset/lontong.jpg',
      menuPrice: 1500,
      isPackage: false,
    ),
    Menu(
      menuId: 'menu-5',
      menuName: 'Tahu Isi',
      menuDesc: 's',
      menuImg: 'asset/tahuisi.png',
      menuPrice: 1500,
      isPackage: false,
    ),
    Menu(
      menuId: 'menu-6',
      menuName: 'Mie Goreng',
      menuDesc: 's',
      menuImg: 'asset/miegoreng.jpg',
      menuPrice: 2000,
      isPackage: false,
    ),
    Menu(
      menuId: 'menu-7',
      menuName: 'Bihun Goreng',
      menuDesc: 's',
      menuImg: 'asset/bihun.jpg',
      menuPrice: 2000,
      isPackage: false,
    ),
  ];
}
