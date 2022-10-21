import 'package:flutter/material.dart';
import 'package:mini_project/model/page_route.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/utils/validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscure = true;
  bool _obscure2 = true;

  final _controllerNama = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _ctrlConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    var outlineInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF5F5F58),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
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
              TextFormField(
                validator: (value) => Validator.validateField(value: value!),
                controller: _controllerNama,
                decoration: InputDecoration(
                  hintText: 'Masukkan nama lengkap anda..',
                  border: outlineInputBorder,
                ),
              ),
              const SizedBox(height: 12),
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
                controller: _controllerEmail,
                decoration: InputDecoration(
                  hintText: 'Masukkan email anda..',
                  border: outlineInputBorder,
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
                controller: _controllerPassword,
                obscureText: _obscure,
                decoration: InputDecoration(
                  hintText: 'Masukkan password anda..',
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
                  border: outlineInputBorder,
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                obscureText: _obscure2,
                validator: (value) => Validator.validatePassword(pw: value!),
                controller: _ctrlConfirmPassword,
                decoration: InputDecoration(
                  hintText: 'Konfirmasi password anda..',
                  suffixIcon: IconButton(
                    color: CustomColors.neutralColor,
                    onPressed: () {
                      setState(() {
                        _obscure2 = !_obscure2;
                      });
                    },
                    icon: Icon(
                      (_obscure2 == true)
                          ? Icons.visibility
                          : Icons.visibility_outlined,
                    ),
                  ),
                  border: outlineInputBorder,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  onPressed: () {},
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
    );
  }
}
