import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  String uid, email, name;
  int balance;

  UserModel(
      {required this.uid,
      required this.email,
      required this.name,
      this.balance = 0});
}
