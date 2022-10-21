import 'package:flutter/material.dart';
import 'package:mini_project/model/page_route.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/utils/validator.dart';

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
              TextFormField(
                validator: (value) => Validator.validateField(value: value!),
                decoration: const InputDecoration(
                  hintText: 'Masukkan email anda..',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.neutralColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                validator: (value) => Validator.validatePassword(pw: value!),
                obscureText: _obscure,
                decoration: InputDecoration(
                  hintText: 'Masukkan password anda..',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.neutralColor,
                    ),
                  ),
                  suffixIcon: IconButton(
                    color: CustomColors.neutralColor,
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                    icon: Icon(
                      (_obscure == true)
                          ? Icons.visibility
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
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
                ],
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
