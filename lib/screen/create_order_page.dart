import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/provider/all_menu.dart';
import 'package:mini_project/utils/page_route.dart';
import 'package:mini_project/utils/validator.dart';
import 'package:mini_project/widgets/input_form_field.dart';
import 'package:provider/provider.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  final _formKey = GlobalKey<FormState>();

  final totalOrder = TextEditingController();
  final alamatController = TextEditingController();
  final waktuController = TextEditingController();
  final noteController = TextEditingController();

  final validator = Validator();

  final List<String> menuNameList = [];
  String? selectedItem;
  int i = 3;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    final menu = Provider.of<ListMenu>(context).menuList;

    for (int i = 0; i < menu.length; i++) {
      menuNameList.add(menu.elementAt(i).menuName);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Buat Pesanan",
          style: TextStyle(fontSize: 22),
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
                "Menu Katering",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              DropdownSearch(
                validator: (String? value) =>
                    Validator().validateField(field: value!),
                items: menuNameList,
                onChanged: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Pilih jenis menu..',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              InputFormField(
                validator: (value) => validator.validateField(field: value!),
                controller: totalOrder,
                keyboardType: TextInputType.number,
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
                keyboardType: TextInputType.streetAddress,
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
                keyboardType: TextInputType.datetime,
                hintText: 'Masukkan waktu pengiriman..',
                helperText: 'contoh : 30-02-2035, 15:00 WIB',
                obscureText: false,
                suffixIcon: IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025, 12, 30, 24, 0),
                        locale: const Locale('id'),
                      );

                      // String selectedTime =
                      //     "${time.day}-${time.month}-${time.year}, ${time.hour}:${time.minute} WIB";
                      // setState(() {
                      //   waktuController.text = selectedTime;
                      // });
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
                keyboardType: TextInputType.text,
                hintText: 'Masukkan catatan..',
                helperText: '',
                obscureText: false,
                suffixIcon: const SizedBox(),
              ),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showDialogPopup();
                    }
                  },
                  child: const Text("Buat Pesanan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDialogPopup() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Pesanan'),
          content: const Text(
            'Pesanan akan dibuat dengan memakai saldo anda sebesar 10% dari Total Harga pesanan yaitu Rp. 0 sebagai uang muka.\nAnda dapat membayar sisanya setelah menerima katering.',
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
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                wrapperPage,
                (route) => false,
              ),
            ),
          ],
        );
      },
    );
  }
}
