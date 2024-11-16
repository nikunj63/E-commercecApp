import 'package:ecommerce_frontend/core/ui.dart';
import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color:AppColors.accent,
      child: Text("Log In"), 
      onPressed: (){}
      );
  }
}