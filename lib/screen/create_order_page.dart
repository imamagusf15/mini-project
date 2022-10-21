import 'package:flutter/material.dart';
import 'package:mini_project/res/custom_color.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Buat Pesanan",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan email anda..',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.neutralColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
