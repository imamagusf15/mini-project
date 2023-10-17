import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                width: width,
                // height: height - (height * 0.6),
                color: CustomColors.tertiaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: SizedBox(
                        height: 96,
                        width: 96,
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
                padding: size.height > 480
                    ? EdgeInsets.all(16)
                    : EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
        ),
      ),
    );
  }
}
