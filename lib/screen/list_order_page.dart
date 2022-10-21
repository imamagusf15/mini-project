import 'package:flutter/material.dart';
import 'package:mini_project/model/order.dart';

import '../../model/page_route.dart';
import '../../res/custom_color.dart';
import '../../utils/currency_format.dart';

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

class ListOrder extends StatelessWidget {
  const ListOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: listOrder.length,
      itemBuilder: (context, index) {
        final Order order = listOrder[index];
        int totalPrice = order.totalOrder * order.menuPrice;
        return GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(detailOrderPage, arguments: order),
          child: Card(
            color: CustomColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.menuName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "${order.totalOrder} buah",
                        ),
                        const SizedBox(height: 12),
                        const Text("Total Harga"),
                        const SizedBox(height: 4),
                        Text(
                          CurrencyFormat.convertToIdr(totalPrice, 2),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'asset/nasipaketA.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
