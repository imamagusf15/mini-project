import 'package:flutter/material.dart';

import 'package:mini_project/utils/validator.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
            const Text(
              "Email",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            TextFormField(
              validator: (value) => Validator.validateField(value: value!),
              decoration: const InputDecoration(
                hintText: 'Masukkan email anda..',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF5F5F58),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Kirim Email"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
