import 'package:ecommerce_frontend/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Routes{
  static Route ? onGenerateRoute(RouteSettings settings){
    switch(settings.name){

      case LoginScreen.routeName: return CupertinoPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => LoginProvider(context),
          child: const LoginScreen())
        );

        case SignUpScreen.routeName: return CupertinoPageRoute(
        builder: (context) => const SignUpScreen()
        );

        default: return null;


    }
  }
}