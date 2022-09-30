import 'package:flutter/material.dart';
import 'package:scania_project/src/app/components/standard_clickable_text.dart';
import 'package:scania_project/src/app/components/custom_textforms.dart';
import 'package:scania_project/src/app/modules/create_account/forgot_password.dart';
import 'package:scania_project/src/app/modules/home_page/home_page.dart';
import 'package:scania_project/src/utils/export.dart';
import 'package:scania_project/src/app/components/red_button.dart';
import 'package:scania_project/src/app/modules/create_account/create_account.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 19, 60),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: PaddingSizes.introPageBorder,
            right: PaddingSizes.introPageBorder,
            top: PaddingSizes.introPageTop,
          ),
          child: Column(
            children: [
              const Text(
                complex,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50, color: Color.fromARGB(255, 180, 70, 82)),
              ),
              const SizedBox(
                height: 50.0,
              ),
              LoginTextForm(
                label: eMail,
              ),
              const SizedBox(
                height: 15.0,
              ),
              LoginTextForm(
                label: password,
              ),
              const SizedBox(
                height: 50.0,
              ),
              StandardButton(
                buttonText: login,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => HomePage()),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              StandardClickableText(
                label: createAccountBtn,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => CreateAccount()),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              StandardClickableText(
                label: forgotPassword,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ForgotPassword()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
