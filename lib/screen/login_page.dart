import 'package:flutter/material.dart';
import 'package:mini_project/utils/page_route.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/utils/validator.dart';
import 'package:mini_project/widgets/input_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
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
              const InputFormField(
                hintText: 'Masukkan email anda..',
                helperText: '',
                obscureText: false,
                suffixIcon: SizedBox(),
              ),
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              InputFormField(
                obscureText: _obscure,
                hintText: 'Masukkan password anda..',
                helperText: '',
                suffixIcon: IconButton(
                  color: CustomColors.neutralColor,
                  icon: Icon(
                    (_obscure == true)
                        ? Icons.visibility
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(forgetPasswordPage),
                  child: const Text(
                    "Lupa Password?",
                    style: TextStyle(
                      fontSize: 12,
                      color: CustomColors.neutralColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(wrapperPage);
                  },
                  child: const Text("Login"),
                ),
              ),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).popAndPushNamed(registerPage),
                  child: const Text("Belum punya akun? Daftar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
