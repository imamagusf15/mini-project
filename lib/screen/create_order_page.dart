import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/model/order.dart';
import 'package:mini_project/utils/page_route.dart';
import 'package:mini_project/utils/validator.dart';
import 'package:mini_project/widgets/drop_down_field.dart';
import 'package:mini_project/widgets/input_form_field.dart';
import 'package:provider/provider.dart';

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

    final totalOrder = TextEditingController();
    final alamatController = TextEditingController();
    TextEditingController waktuController = TextEditingController();
    final noteController = TextEditingController();

    final validator = Validator();

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
            InputFormField(
              validator: (value) => validator.validateField(field: value!),
              controller: totalOrder,
              hintText: 'Masukkan jumlah pesanan..',
              helperText: 'contoh: 50',
              obscureText: false,
              suffixIcon: const SizedBox(),
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
            InputFormField(
              validator: (value) => validator.validateField(field: value!),
              controller: alamatController,
              hintText: 'Masukkan alamat tujuan..',
              helperText: '',
              obscureText: false,
              suffixIcon: const SizedBox(),
            ),
            const Text(
              "Waktu",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            InputFormField(
              validator: (value) => validator.validateField(field: value!),
              controller: waktuController,
              hintText: 'Masukkan waktu pengiriman..',
              helperText: 'contoh : 30/02/2035, 15.00 WIB',
              obscureText: false,
              suffixIcon: IconButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(
                      context,
                      currentTime: DateTime.now(),
                      maxTime: DateTime(2025, 12, 30, 24, 0),
                      minTime: DateTime.now(),
                      locale: LocaleType.id,
                      onConfirm: (time) {
                        var selectedTime =
                            "${time.toLocal().day}/${time.toLocal().month}/${time.toLocal().year} ${time.toLocal().hour}.${time.toLocal().minute} WIB";
                        setState(() {
                          waktuController.text = selectedTime;
                        });
                      },
                    );
                  },
                  icon: const Icon(Icons.date_range)),
            ),
            const SizedBox(height: 4),
            const Text(
              "Catatan",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            InputFormField(
              validator: null,
              controller: noteController,
              hintText: 'Masukkan catatan..',
              helperText: '',
              obscureText: false,
              suffixIcon: const SizedBox(),
            ),
            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: () {
                  _showDialogPopup();
                },
                child: const Text("Buat Pesanan"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDialogPopup() async {
    final orderData = Provider.of<Order>(context);
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Pesanan'),
          content: const Text(
            'Pesanan akan dibuat dengan memakai saldo anda sebesar Rp. 0 sebagai uang muka.\nAnda dapat membayar sisanya setelah menerima katering.',
            textAlign: TextAlign.justify,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Batal',
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text(
                'Setuju',
              ),
              onPressed: () => Navigator.of(context).popAndPushNamed(
                  detailOrderPage,
                  arguments: orderData.orderId),
            ),
          ],
        );
      },
    );
  }
}
