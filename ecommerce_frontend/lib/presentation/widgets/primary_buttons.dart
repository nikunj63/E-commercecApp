import 'package:ecommerce_frontend/core/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;  

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    });

  @override
Widget build(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: CupertinoButton(
      color: AppColors.accent,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white, // Ensure this contrasts with `AppColors.accent`
          fontSize: 16, // Adjust font size as needed
        ),
      ),
      onPressed: onPressed,
    ),
  );
}

}