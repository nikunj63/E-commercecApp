import 'package:ecommerce_frontend/core/ui.dart';
import 'package:ecommerce_frontend/presentation/widgets/gap_widget.dart';
import 'package:ecommerce_frontend/presentation/widgets/link_button.dart';
import 'package:ecommerce_frontend/presentation/widgets/primary_buttons.dart';
import 'package:ecommerce_frontend/presentation/widgets/primary_textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("E-CommerceApp")
      ),
      body: SafeArea(
        child: ListView(
          padding:const  EdgeInsets.all(16),
          children: [
             Text(
              "Log In",
              style:TextStyles.heading2
              
            ),
            const GapWidget(),

            PrimaryTextfield(
              controller: emailController,
              labelText: "Email Address"
              ),
            

            const GapWidget(),


            PrimaryTextfield(
              controller: passwordController,
              obscureText: true,
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
              onPressed: (){},
              text: "Log In",
              ),
              const GapWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have Account?",style:TextStyle(fontSize:16)),
                  const SizedBox(width:16),
                  LinkButton(
                    onPressed: (){},
                    text: "Sign Up"
                    )
                  
                ],
              )
          ],
        )
      ),
    );
  }
}