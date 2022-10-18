import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/screen/login_page.dart';
import 'package:mini_project/utils/validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = '/register-page';

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
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0x5F5F58),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
              Text(
                "Nama",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              TextFormField(
                validator: (value) => Validator.validateField(value: value!),
                controller: _controllerNama,
                decoration: InputDecoration(
                  hintText: 'Masukkan nama lengkap anda..',
                  border: outlineInputBorder,
                ),
              ),
              SizedBox(height: 12),
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
                controller: _controllerEmail,
                decoration: InputDecoration(
                  hintText: 'Masukkan email anda..',
                  border: outlineInputBorder,
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
              SizedBox(height: 4),
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
              SizedBox(height: 24),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Buat Akun"),
                ),
              ),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, LoginPage.routeName),
                  child: Text("Sudah punya akun? Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
