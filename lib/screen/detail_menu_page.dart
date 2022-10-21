import 'package:flutter/material.dart';

import '../model/menu.dart';
import '../utils/currency_format.dart';

class DetailMenuPage extends StatelessWidget {
  const DetailMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menu = ModalRoute.of(context)!.settings.arguments as Menu;

    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(menu.menuName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            menu.menuImg,
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
                Text(menu.menuDesc),
                const SizedBox(height: 16),
                Text(
                  (menu.isPackage == true) ? "Isian Lauk" : "Pilihan Isi",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  (menu.isPackage == true) ? "Harga/box" : "Harga/buah",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  CurrencyFormat.convertToIdr(menu.menuPrice, 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
