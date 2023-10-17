import 'package:flutter/material.dart';
import 'package:mini_project/provider/all_order.dart';
import 'package:mini_project/widgets/card_menu.dart';
import 'package:provider/provider.dart';

class ListOrderPage extends StatelessWidget {
  const ListOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<ListOrder>(context, listen: false).listOrder;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pesanan",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orderData.length,
        itemBuilder: (context, index) {
          orderData[index].totalPrice =
              orderData[index].totalOrder * orderData[index].menuPrice;
          return ChangeNotifierProvider.value(
            value: orderData[index],
            child: const CardListOrder(),
          );
        },
      ),
    );
  }
}
