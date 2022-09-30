import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoginTextForm extends StatelessWidget {
  final String label;
  final Function()? onEditingComplete;
  final TextEditingController? userInputController;
  final FocusNode? focusNode;

  LoginTextForm({
    required this.label,
    this.userInputController,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: userInputController,
      style: const TextStyle(color: Colors.white),
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(color: Color.fromARGB(255, 180, 70, 82)),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 145, 34, 47),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 180, 70, 82),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

class AddTextForm extends StatelessWidget {
  final String label;
  final Function()? onEditingComplete;
  final TextEditingController? userInputController;
  final FocusNode? focusNode;

  AddTextForm({
    required this.label,
    this.userInputController,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: userInputController,
      style: const TextStyle(color: Color.fromARGB(255, 180, 70, 82)),
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(color: Color.fromARGB(255, 180, 70, 82)),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 145, 34, 47),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 180, 70, 82),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}