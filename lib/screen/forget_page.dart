import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/utils/firebase_auth_service.dart';
import 'package:mini_project/utils/validator.dart';
import 'package:mini_project/widgets/input_form_field.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  final emailController = TextEditingController();
  final validator = Validator();
  final fieldKey = GlobalKey<FormState>();

  final auth = Auth();

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
            Form(
              key: fieldKey,
              child: InputFormField(
                validator: (value) => validator.validateEmail(email: value!),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Masukkan email anda..',
                helperText: '',
                obscureText: false,
                suffixIcon: const SizedBox(),
              ),
            ),
            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: () async {
                  if (fieldKey.currentState!.validate()) {
                    auth.sendPasswordResetEmail(
                      email: emailController.text,
                      context: context,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: CustomColors.tertiaryColor,
                        content: Text(
                          "Email berhasil terkirim!",
                        ),
                      ),
                    );
                  }
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
