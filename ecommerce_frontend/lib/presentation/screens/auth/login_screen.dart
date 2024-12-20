import 'package:ecommerce_frontend/core/ui.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce_frontend/presentation/widgets/gap_widget.dart';
import 'package:ecommerce_frontend/presentation/widgets/link_button.dart';
import 'package:ecommerce_frontend/presentation/widgets/primary_buttons.dart';
import 'package:ecommerce_frontend/presentation/widgets/primary_textField.dart';
import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("E-CommerceApp")
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
            (provider.error != "") ? Text(
              provider.error,
              style: const  TextStyle(color: Colors.red),
            ) : const SizedBox(),
           const  GapWidget(),

            PrimaryTextfield(
              controller: provider.emailController,
              labelText: "Email Address"
              ),
            

            const GapWidget(),


            PrimaryTextfield(
              controller: provider.passwordController,
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
              onPressed: provider.logIn,
              text:(provider.isLoading) ? ".....": "Log In",
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