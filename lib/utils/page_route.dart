import 'package:flutter/cupertino.dart';
import '../screen/wrapper_page.dart';
import '../screen/create_order_page.dart';
import '../screen/detail_menu_page.dart';
import '../screen/detail_order_page.dart';
import '../screen/forget_page.dart';
import '../screen/home_page.dart';
import '../screen/info_page.dart';
import '../screen/list_order_page.dart';
import '../screen/login_page.dart';
import '../screen/register_page.dart';

const String registerPage = '/register-page';
const String loginPage = '/login-page';
const String listOrderPage = '/list-order-page';
const String infoPage = '/info-page';
const String homePage = '/home-page';
const String forgetPasswordPage = '/forget-password-page';
const String detailOrderPage = '/detail-order-page';
const String detailMenuPage = '/detail-menu';
const String createOrderPage = '/create-order-page';
const String wrapperPage = '/wrapper-page';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  registerPage: (context) => const RegisterPage(),
  loginPage: (context) => const LoginPage(),
  homePage: (context) => const HomePage(),
  forgetPasswordPage: (context) => const ForgetPage(),
  detailMenuPage: (context) => const DetailMenuPage(),
  createOrderPage: (context) => const CreateOrderPage(),
  infoPage: (context) => const InfoPage(),
  listOrderPage: (context) => const ListOrderPage(),
  detailOrderPage: (context) => const DetailOrderPage(),
  wrapperPage: (context) => const WrapperPage()
};
