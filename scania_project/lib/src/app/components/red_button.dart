import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;

  StandardButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 180, 70, 82),
          onPrimary: const Color.fromARGB(255, 145, 34, 47),
          elevation: 20,
          shadowColor: const Color.fromARGB(255, 180, 70, 82),
        ),
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20.0,
              color: Color.fromARGB(255, 15, 19, 60),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}