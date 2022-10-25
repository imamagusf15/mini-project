import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project/model/user_model.dart';
import 'package:mini_project/utils/firebase_auth_service.dart';
import 'package:mini_project/utils/page_route.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/utils/validator.dart';
import 'package:mini_project/widgets/input_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscureText = true;
  bool obscureText2 = true;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final validator = Validator();

  final auth = Auth();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nama",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                InputFormField(
                  validator: (value) => validator.validateField(field: value!),
                  controller: nameController,
                  hintText: 'Masukkan nama lengkap anda..',
                  helperText: '',
                  obscureText: false,
                  suffixIcon: const SizedBox(),
                ),
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
                  helperText: 'contoh: email@gmail.com',
                  obscureText: false,
                  suffixIcon: const SizedBox(),
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
                InputFormField(
                  validator: (value) =>
                      validator.validatePassword(password: value!),
                  controller: passwordController,
                  hintText: 'Masukkan password anda..',
                  helperText: 'contoh: pwsd123',
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    color: CustomColors.neutralColor,
                    onPressed: () {},
                    icon: Icon(
                      (obscureText == true)
                          ? Icons.visibility
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        UserModel? user =
                            await auth.createUserWithEmailAndPassword(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        if (user != null) {
                          if (!mounted) return;
                          Navigator.of(context)
                              .pushReplacementNamed(wrapperPage);
                        }
                      }
                    },
                    child: const Text("Buat Akun"),
                  ),
                ),
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).popAndPushNamed(loginPage),
                    child: const Text("Sudah punya akun? Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
