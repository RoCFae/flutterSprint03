import 'package:flutter/material.dart';

class StandardClickableText extends StatelessWidget {
  final String label;
  final Function()? onTap;

  StandardClickableText({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(fontSize: 15, color: const Color.fromARGB(255, 180, 70, 82), decoration: TextDecoration.underline),
      ),
    );
  }
}
