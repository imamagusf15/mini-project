import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/model/user_model.dart';
import 'package:mini_project/provider/all_menu.dart';
import 'package:mini_project/utils/currency_format.dart';
import 'package:mini_project/utils/page_route.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:provider/provider.dart';
import 'package:mini_project/widgets/card_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = UserModel(
      uid: auth.currentUser!.uid,
      email: auth.currentUser!.email!,
      name: auth.currentUser!.displayName!,
    );

    final menuData = Provider.of<ListMenu>(context, listen: false).menuList;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 48),
              decoration: const BoxDecoration(
                color: CustomColors.tertiaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "Halo,\n${user.name}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ClipOval(
                            child: SizedBox(
                              height: 96,
                              width: 96,
                              child: Image.asset(
                                'asset/logokatering.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Saldo", style: TextStyle(fontSize: 16)),
                          Text(CurrencyFormat.convertToIdr(user.balance, 0),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      trailing: TextButton.icon(
                        style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll<Color>(Colors.black),
                        ),
                        onPressed: () {
                          auth.signOut();
                          Navigator.of(context).popAndPushNamed(loginPage);
                        },
                        icon: const Icon(Icons.logout),
                        label: const Text("Logout"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 4),
              child: Text(
                "Menu Paket",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: menuData.length,
              itemBuilder: (context, index) {
                if (menuData[index].isPackage == true) {
                  return ChangeNotifierProvider.value(
                    value: menuData[index],
                    child: const CardMenuPaket(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 4),
              child: Text(
                "Lainnya",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                clipBehavior: Clip.none,
                itemCount: menuData.length,
                itemBuilder: (context, index) {
                  if (menuData[index].isPackage == false) {
                    return ChangeNotifierProvider.value(
                      value: menuData[index],
                      child: const CardMenuLain(),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Buat Pesanan',
        backgroundColor: CustomColors.tertiaryColor,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => Navigator.of(context).pushNamed(createOrderPage),
      ),
    );
  }
}
