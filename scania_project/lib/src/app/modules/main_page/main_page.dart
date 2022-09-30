import 'package:flutter/material.dart';
import 'package:scania_project/src/app/modules/login_page/login_page.dart';

import '../create_account/create_account.dart';
import '../create_account/forgot_password.dart';
import '../home_page/home_page.dart';
import '../vehicles_pages/vehicle_information.dart';
import '../vehicles_pages/vehicles_page.dart';
import '../vehicles_pages/vehicles_register.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        // '/': (context) => MyApp(),
        //   '/home': (context) => HomePage(),
        //   '/create-account': (context) => CreateAccount(),
        //   '/forgot-password': (context) => ForgotPassword(),
        //   '/vehicles-list': (context) => const VehiclesPage(),
        '/transacao-detalhes': (context) => VehiclesFormPage(),
        '/vehicles-form': (context) => VehiclesFormPage(),
        '/vehicles-info': (context) => const VehiclesInfo(),
      },
    );
  }
}
