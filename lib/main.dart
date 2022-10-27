import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/provider/all_menu.dart';
import 'package:mini_project/provider/all_order.dart';
import 'package:mini_project/screen/login_page.dart';
import 'package:mini_project/screen/wrapper_page.dart';
import 'package:mini_project/utils/firebase_auth_service.dart';
import 'package:mini_project/utils/page_route.dart';
import 'package:provider/provider.dart';
import 'package:mini_project/res/custom_color.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return MultiProvider(
      providers: [
        Provider<ListMenu>(create: (context) => ListMenu()),
        Provider<ListOrder>(create: (context) => ListOrder()),
        Provider<Auth>(create: (context) => Auth())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: CustomColors.tertiaryColor,
          scaffoldBackgroundColor: CustomColors.primaryColor,
        ),
        routes: pageRoutes,
        home: user != null ? const WrapperPage() : const LoginPage(),
      ),
    );
  }
}
