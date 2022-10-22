import 'package:flutter/material.dart';
import 'package:mini_project/utils/page_route.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:mini_project/widgets/input_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscure = true;
  bool _obscure2 = true;

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
              const InputFormField(
                hintText: 'Masukkan nama lengkap anda..',
                helperText: '',
                obscureText: false,
                suffixIcon: SizedBox(),
              ),
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
                helperText: 'contoh: email@gmail.com',
                obscureText: false,
                suffixIcon: SizedBox(),
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
                hintText: 'Masukkan password anda..',
                helperText: 'contoh: pwsd123',
                obscureText: _obscure,
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
              const SizedBox(height: 4),
              InputFormField(
                hintText: 'Konfirmasi password anda..',
                helperText: '',
                obscureText: _obscure2,
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
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).popAndPushNamed(wrapperPage),
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
