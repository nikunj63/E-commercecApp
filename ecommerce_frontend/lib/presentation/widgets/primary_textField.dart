import 'package:flutter/material.dart';

class PrimaryTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;


  const PrimaryTextfield({
    super.key,
    this.controller,
    required this.labelText,
    this.obscureText = false,
    this.validator,
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              controller: controller,
              obscureText: obscureText,
              validator: validator,
              decoration:   InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7)
                ),
                labelText: labelText,
              ),
            );
  }
}