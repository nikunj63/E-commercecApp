import 'dart:async';

import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_state.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void getToNextScreen(){
    UserState userState = BlocProvider.of<UserCubit>(context).state;

    if (userState is UserLoggedInState) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context,HomeScreen.routeName);
    }
    
    else if(userState is UserLoggedOutState){
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context,LoginScreen.routeName);
    }

    else if(userState is UserErrorState){
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context,LoginScreen.routeName);
    }
  }

  @override
  void initState(){
    super.initState();
    Timer(const Duration(milliseconds: 100), (){
       getToNextScreen();
    });
  }




  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context , state){
        getToNextScreen();
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}