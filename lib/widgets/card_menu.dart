import 'package:flutter/material.dart';

import '../model/menu.dart';
import '../model/page_route.dart';
import '../res/custom_color.dart';
import '../utils/currency_format.dart';

class CardMenuPaket extends StatelessWidget {
  const CardMenuPaket({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          final Menu menu = menuList[index];
          if (menu.isPackage == true) {
            return GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(detailMenuPage, arguments: menu),
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
                          menu.menuImg,
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
                              menu.menuName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              menu.menuDesc,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              CurrencyFormat.convertToIdr(menu.menuPrice, 2),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class CardMenuLain extends StatelessWidget {
  const CardMenuLain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        clipBehavior: Clip.none,
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          final Menu menu = menuList[index];
          if (menu.isPackage == false) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(detailMenuPage, arguments: menu),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 80,
                        width: 100,
                        child: Image.asset(
                          menu.menuImg,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    menu.menuName,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
