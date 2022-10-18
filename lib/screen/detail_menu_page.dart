import 'package:flutter/material.dart';

class DetailMenuPage extends StatelessWidget {
  const DetailMenuPage({super.key});

  static const routeName = '/detail-menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paket A"),
      ),
    );
  }
}
