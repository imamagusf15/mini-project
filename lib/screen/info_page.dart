import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height - (height * 0.7),
            color: CustomColors.tertiaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                    height: 96,
                    width: 96,
                    color: Colors.white,
                    child: Image.asset(
                      'asset/logokatering.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Ma'Uti Catering",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Info Kontak",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "No. Telepon",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("0812-3456-789"),
                SizedBox(height: 16),
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("email@gmail.com"),
                SizedBox(height: 16),
                Text(
                  "Alamat",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Bogor")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
