import 'package:flutter/material.dart';
import 'package:mini_project/model/page_route.dart';
import 'package:mini_project/res/custom_color.dart';

import '../../widgets/card_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 32),
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
                          const Text(
                            "Selamat Pagi,\nImam",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ClipOval(
                              child: Image.asset(
                                'asset/bihun.jpg',
                                height: 80,
                                width: 80,
                                fit: BoxFit.fill,
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
                          children: const [
                            Text("Saldo", style: TextStyle(fontSize: 16)),
                            Text("Rp. 0",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        trailing: TextButton.icon(
                          style: const ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll<Color>(Colors.black),
                          ),
                          onPressed: () =>
                              Navigator.of(context).pushNamed(registerPage),
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
              const CardMenuPaket(),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 4),
                child: Text(
                  "Lainnya",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const CardMenuLain(),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Buat Pesanan',
        backgroundColor: CustomColors.tertiaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).pushNamed(createOrderPage),
      ),
    );
  }
}
