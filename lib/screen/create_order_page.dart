import 'package:flutter/material.dart';
import 'package:mini_project/model/order.dart';
import 'package:mini_project/utils/page_route.dart';
import 'package:mini_project/widgets/drop_down_field.dart';
import 'package:mini_project/widgets/input_form_field.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  final menu = [
    "Paket A",
    "Paket B",
    "Paket C",
    "Lontong Isi",
    "Tahu Isi",
    "Mie Goreng",
    "Bihun Goreng"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Buat Pesanan",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Menu Katering",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              DropDownField(
                menu: menu,
                hintText: 'Pilih jenis makanan..',
              ),
              const SizedBox(height: 4),
              const InputFormField(
                hintText: 'Masukkan jumlah pesanan..',
                helperText: 'contoh: 50',
                obscureText: false,
                suffixIcon: SizedBox(),
              ),
              const Text(
                "Total Harga: Rp. 0",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Alamat",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const InputFormField(
                hintText: 'Masukkan alamat tujuan..',
                helperText: '',
                obscureText: false,
                suffixIcon: SizedBox(),
              ),
              const Text(
                "Waktu",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const InputFormField(
                hintText: 'Masukkan waktu pengiriman..',
                helperText: 'contoh : 30/02/2035, 15.00 WIB',
                obscureText: false,
                suffixIcon: SizedBox(),
              ),
              const SizedBox(height: 4),
              const Text(
                "Catatan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const InputFormField(
                hintText: 'Masukkan waktu pengiriman..',
                helperText: '',
                obscureText: false,
                suffixIcon: SizedBox(),
              ),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).popAndPushNamed(
                      detailOrderPage,
                      arguments: listOrder[1]),
                  child: const Text("Buat Pesanan"),
                ),
              ),
            ],
          ),
        ));
  }
}
