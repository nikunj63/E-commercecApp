import 'package:ecommerce_frontend/core/ui.dart';
import 'package:flutter/cupertino.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final Function()? onPressed; 
  final Color ? color; 

  const LinkButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Text(text , style: TextStyle(
        color: color ?? AppColors.accent
      ),), 
      onPressed: onPressed,
      );
  }
}