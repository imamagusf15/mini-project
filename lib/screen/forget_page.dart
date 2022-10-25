import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mini_project/utils/validator.dart';
import 'package:mini_project/widgets/input_form_field.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    final emailController = TextEditingController();
    final validator = Validator();

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
            InputFormField(
              validator: (value) => validator.validateEmail(email: value!),
              controller: emailController,
              hintText: 'Masukkan email anda..',
              helperText: '',
              obscureText: false,
              suffixIcon: const SizedBox(),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: () async {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: emailController.text);
                },
                child: const Text("Kirim Email"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
