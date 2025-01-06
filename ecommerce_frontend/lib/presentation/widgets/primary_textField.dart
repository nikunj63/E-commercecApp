import 'package:flutter/material.dart';

class PrimaryTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Function(String)? onChanged;

  const PrimaryTextfield({
    super.key,
    this.controller,
    required this.labelText,
    this.obscureText = false,
    this.validator,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      // Use initialValue only if controller is not provided
      initialValue: controller == null ? initialValue : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        labelText: labelText,
      ),
    );
  }
}
