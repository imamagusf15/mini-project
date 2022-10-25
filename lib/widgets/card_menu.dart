import 'package:flutter/material.dart';
import 'package:mini_project/model/menu.dart';
import 'package:mini_project/model/order.dart';
import 'package:provider/provider.dart';

import '../utils/page_route.dart';
import '../res/custom_color.dart';
import '../utils/currency_format.dart';

class CardMenuPaket extends StatelessWidget {
  const CardMenuPaket({super.key});

  @override
  Widget build(BuildContext context) {
    final menuData = Provider.of<Menu>(context, listen: false);

    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(detailMenuPage, arguments: menuData.menuId),
      child: Card(
        color: CustomColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(
                  menuData.menuImg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menuData.menuName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      menuData.menuDesc,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      CurrencyFormat.convertToIdr(menuData.menuPrice, 2),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardMenuLain extends StatelessWidget {
  const CardMenuLain({super.key});

  @override
  Widget build(BuildContext context) {
    final menuData = Provider.of<Menu>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(detailMenuPage, arguments: menuData.menuId),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 80,
                width: 100,
                child: Image.asset(
                  menuData.menuImg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            menuData.menuName,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CardListOrder extends StatelessWidget {
  const CardListOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context, listen: false);

    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(detailOrderPage, arguments: orderData.orderId),
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
                      orderData.menuName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "${orderData.totalOrder} buah",
                    ),
                    const SizedBox(height: 12),
                    const Text("Total Harga"),
                    const SizedBox(height: 4),
                    Text(
                      CurrencyFormat.convertToIdr(orderData.totalPrice, 2),
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
                  orderData.menuImg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
