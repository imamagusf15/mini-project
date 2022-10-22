import 'package:flutter/material.dart';
import 'package:mini_project/widgets/card_menu.dart';

class ListOrderPage extends StatefulWidget {
  const ListOrderPage({super.key});

  @override
  State<ListOrderPage> createState() => _ListOrderPageState();
}

class _ListOrderPageState extends State<ListOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pesanan",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: const ListOrder(),
    );
  }
}
