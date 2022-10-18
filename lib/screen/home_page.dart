import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/screen/detail_menu_page.dart';
import 'package:mini_project/screen/login_page.dart';
import 'package:mini_project/screen/order_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                              Navigator.pushNamed(context, LoginPage.routeName),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, DetailMenuPage.routeName),
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
                            child: Image.asset(
                              'asset/nasipaketA.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Paket A",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Nasi putih, sayur capcay, ayam goreng, telur balado, kentang balado ati sapi",
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Rp. 22.000",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, DetailMenuPage.routeName),
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
                            child: Image.asset(
                              'asset/nasipaketA.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Paket A",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Nasi putih, sayur capcay, ayam goreng, telur balado, kentang balado ati sapi",
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Rp. 22.000",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, DetailMenuPage.routeName),
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
                            child: Image.asset(
                              'asset/nasipaketA.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Paket A",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Nasi putih, sayur capcay, ayam goreng, telur balado, kentang balado ati sapi",
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Rp. 22.000",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 4),
                child: Text(
                  "Lainnya",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, DetailMenuPage.routeName),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                height: 80,
                                width: 100,
                                child: Image.asset(
                                  'asset/lontong.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Lontong Isi",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, DetailMenuPage.routeName),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                height: 80,
                                width: 100,
                                child: Image.asset(
                                  'asset/lontong.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Lontong Isi",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, DetailMenuPage.routeName),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                height: 80,
                                width: 100,
                                child: Image.asset(
                                  'asset/lontong.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Lontong Isi",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, DetailMenuPage.routeName),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                height: 80,
                                width: 100,
                                child: Image.asset(
                                  'asset/lontong.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Lontong Isi",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.tertiaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pushNamed(context, OrderPage.routeName),
      ),
    );
  }
}
