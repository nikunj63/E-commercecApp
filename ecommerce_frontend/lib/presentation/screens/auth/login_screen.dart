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
            const Text(
              "Log In",
              style:TextStyle(
                fontSize:32,
                fontWeight:FontWeight.bold,
              )
            ),
            const SizedBox(height:16),

            PrimaryTextfield(
              controller: emailController,
              labelText: "Email Address"
              ),
            

            const SizedBox(height:16),


            PrimaryTextfield(
              controller: passwordController,
              obscureText: true,
                labelText: "Password"
              ),
            
            const SizedBox(height:16),
            CupertinoButton( 
              onPressed: (){},
              color:Colors.blue,
              child: Text('Log In')
              ),
              const SizedBox(height:16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have Account?",style:TextStyle(fontSize:16)),
                  const SizedBox(width:16),
                  CupertinoButton(
                    child: Text("Sign Up",style: TextStyle(
                      fontSize:16
                    ),),
                    padding: EdgeInsets.zero,
                   onPressed: (){}
                   )
                  
                ],
              )
          ],
        )
      ),
    );
  }
}