import 'package:flutter/material.dart';
import 'package:mini_project/provider/all_menu.dart';
import 'package:provider/provider.dart';
import 'package:mini_project/utils/currency_format.dart';

class DetailMenuPage extends StatelessWidget {
  const DetailMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuId = ModalRoute.of(context)!.settings.arguments as String;
    final menuData = Provider.of<ListMenu>(context)
        .menuList
        .firstWhere((element) => element.menuId == menuId);

    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(menuData.menuName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              menuData.menuImg,
              height: 250,
              width: width,
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Deskripsi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(menuData.menuDesc),
                  const SizedBox(height: 16),
                  Text(
                    menuData.isPackage ? "Isian Lauk" : "Pilihan Isi",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    menuData.isPackage
                        ? "- Lauk 1\n- Lauk 2\n- Lauk 3\n"
                        : "- Pilihan 1\n- Pilihan 2\n",
                  ),
                  const SizedBox(height: 16),
                  Text(
                    menuData.isPackage ? "Harga/box" : "Harga/buah",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    CurrencyFormat.convertToIdr(menuData.menuPrice, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
