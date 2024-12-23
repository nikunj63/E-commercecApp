import 'package:ecommerce_frontend/core/ui.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_state.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/sign_up_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/home/home_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/splash/splash_screen.dart';
import 'package:ecommerce_frontend/presentation/widgets/gap_widget.dart';
import 'package:ecommerce_frontend/presentation/widgets/link_button.dart';
import 'package:ecommerce_frontend/presentation/widgets/primary_buttons.dart';
import 'package:ecommerce_frontend/presentation/widgets/primary_textField.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return BlocListener<UserCubit ,UserState>(
      listener: (context , state) {
        if(state is UserLoggedInState){
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("E-CommerceApp")
        ),
        body: SafeArea(
          child: Form(
            key: provider.formKey,
            child: ListView(
              padding:const  EdgeInsets.all(16),
              children: [
                 Text(
                  "Log In",
                  style:TextStyles.heading2 
                ),
                const GapWidget(),
                (provider.error != "") ? Text(
                  provider.error,
                  style: const  TextStyle(color: Colors.red),
                ) : const SizedBox(),
               const  GapWidget(),
            
                PrimaryTextfield(
                  controller: provider.emailController,
                  validator: (value){
                    if (value == null || value.trim().isEmpty) {
                      return "Email address is required!";
                    }
                    if (!EmailValidator.validate(value.trim())) {
                      return "Invalid Email address";
                    }
                    return null;
                  },
                  labelText: "Email Address"
                  ),
                
            
                const GapWidget(),
            
            
                PrimaryTextfield(
                  controller: provider.passwordController,
                  obscureText: true,
                  validator: (value){
                    if (value == null || value.trim().isEmpty) {
                      return "Password is required!";
                    }
                    return null;
                  },
                    labelText: "Password"
                  ),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LinkButton(
                        onPressed: (){},
                        text: "Forgot Password?"
                        ),
                    ],
                  ),
                
                const GapWidget(),
            
                PrimaryButton(
                  onPressed: provider.logIn,
                  text:(provider.isLoading) ? "...": "Log In",
                  ),
                  const GapWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have Account?",style:TextStyle(fontSize:16)),
      
      
                      const SizedBox(width:16),
      
      
                      LinkButton(
                        onPressed: (){
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        text: "Sign Up"
                        ),
                      
                    ],
                  )
              ],
            ),
          )
        ),
      ),
    );
  }
}