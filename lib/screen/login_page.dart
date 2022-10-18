import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/screen/forget_page.dart';
import 'package:mini_project/screen/home_page.dart';
import 'package:mini_project/screen/register_page.dart';
import 'package:mini_project/utils/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login-page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
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
                      color: CustomColors.neutralColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              TextFormField(
                validator: (value) => Validator.validatePassword(pw: value!),
                obscureText: _obscure,
                decoration: InputDecoration(
                  hintText: 'Masukkan password anda..',
                  border: OutlineInputBorder(
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
                        Navigator.pushNamed(context, ForgetPage.routeName),
                    child: Text(
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
                    Navigator.popAndPushNamed(context, HomePage.routeName);
                  },
                  child: Text("Login"),
                ),
              ),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  onPressed: () => Navigator.popAndPushNamed(
                      context, RegisterPage.routeName),
                  child: Text("Belum punya akun? Daftar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
