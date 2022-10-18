import 'package:flutter/material.dart';

import 'package:mini_project/utils/validator.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  static const routeName = '/forget-password-page';

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lupa Password",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            TextFormField(
              validator: (value) => Validator.validateField(value: value!),
              decoration: InputDecoration(
                hintText: 'Masukkan email anda..',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x5F5F58),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Kirim Email"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
