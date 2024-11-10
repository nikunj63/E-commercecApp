import 'package:flutter/material.dart';

class PrimaryTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  const PrimaryTextfield({
    super.key,
    this.controller,
    required this.labelText,
    this.obscureText = false,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
              controller: controller,
              obscureText: obscureText,
              decoration:   InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7)
                ),
                labelText: labelText,
              ),
            );
  }
}