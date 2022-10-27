import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/model/user_model.dart';
import 'package:mini_project/utils/firebase_auth_service.dart';
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
  bool obscureText = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final auth = Auth();
  final firebaseAuth = FirebaseAuth.instance;
  final validator = Validator();

  final _formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
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
              InputFormField(
                validator: (value) => validator.validateEmail(email: value!),
                controller: emailController,
                hintText: 'Masukkan email anda..',
                helperText: '',
                obscureText: false,
                suffixIcon: const SizedBox(),
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
                validator: (value) =>
                    validator.validatePassword(password: value!),
                controller: passwordController,
                obscureText: obscureText,
                hintText: 'Masukkan password anda..',
                helperText: '',
                suffixIcon: IconButton(
                  color: CustomColors.neutralColor,
                  icon: Icon(
                    obscureText == true
                        ? Icons.visibility
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      UserModel? user = await auth.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                      );
                      if (user != null) {
                        if (!mounted) return;
                        Navigator.of(context).pushReplacementNamed(wrapperPage);
                      }
                    }
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
