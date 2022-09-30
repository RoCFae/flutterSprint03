import 'package:flutter/material.dart';
import 'package:scania_project/src/app/components/red_button.dart';
import 'package:scania_project/src/app/components/custom_textforms.dart';
import 'package:scania_project/src/app/modules/home_page/home_page.dart';
import 'package:scania_project/src/utils/export.dart';

// ignore: use_key_in_widget_constructors
class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 19, 60),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 19, 60),
        centerTitle: true,
        title: const Text(complex, style: TextStyle(color: Color.fromARGB(255, 180, 70, 82)),
        ),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 180, 70, 82)),
      ),
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
                "Criar Conta",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35, color: Color.fromARGB(255, 180, 70, 82)),
              ),
              const SizedBox(
                height: 25.0,
              ),
              LoginTextForm(label: name),
              const SizedBox(
                height: 25.0,
              ),
              LoginTextForm(label: eMail),
              const SizedBox(
                height: 25.0,
              ),
              LoginTextForm(label: cpf),
              const SizedBox(
                height: 25.0,
              ),
              LoginTextForm(label: password),
              const SizedBox(
                height: 25.0,
              ),
              LoginTextForm(label: confirmPassword),
              const SizedBox(
                height: 25.0,
              ),
              StandardButton(
                buttonText: createAccount,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => HomePage()),
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
