import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/screen/detail_menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: CustomColors.tertiaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              height: height - (height * 0.7),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Selamat Pagi,\nImam",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          iconSize: 72,
                          onPressed: () {},
                          icon: Icon(Icons.account_circle),
                        )
                      ],
                    ),
                    SizedBox(height: 36),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Saldo", style: TextStyle(fontSize: 16)),
                          Text("Rp. 0",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      trailing: TextButton.icon(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll<Color>(Colors.black)),
                        onPressed: () {},
                        icon: Icon(Icons.logout),
                        label: Text("Logout"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Container(
                          height: 80,
                          child: Image.asset(
                            'asset/nasipaketA.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Paket A"),
                            Text(
                              "Nasi putih, sayur capcay, ayam goreng, telur balado, kentang balado ati sapi",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                            Text("Rp. 22.000")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
