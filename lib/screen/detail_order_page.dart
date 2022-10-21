import 'package:flutter/material.dart';

class DetailOrderPage extends StatelessWidget {
  const DetailOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Rincian Pesanan",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: const Text("tes"));
  }
}
