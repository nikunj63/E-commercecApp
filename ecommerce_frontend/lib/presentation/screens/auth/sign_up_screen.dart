import 'package:ecommerce_frontend/core/ui.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/sign_up_provider.dart';
import 'package:ecommerce_frontend/presentation/widgets/gap_widget.dart';
import 'package:ecommerce_frontend/presentation/widgets/link_button.dart';
import 'package:ecommerce_frontend/presentation/widgets/primary_buttons.dart';
import 'package:ecommerce_frontend/presentation/widgets/primary_textField.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = "signup";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context);
    return Scaffold(
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
                "Create Account",
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

                const GapWidget(),
          
          
              PrimaryTextfield(
                controller: provider.confirmPasswordController,
                obscureText: true,
                validator: (value){
                  if (value == null || value.trim().isEmpty) {
                    return "Confirm your Password!";
                  }

                  if (value.trim() != provider.passwordController.text) {
                    return "Password do not match";
                  }
                  return null;
                },
                  labelText: "Confirm Password"
                ),
          
                
              
              const GapWidget(),
          
              PrimaryButton(
                onPressed: provider.createAccount,
                text:(provider.isLoading) ? "..." : "Create Account",
                ),
                const GapWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Have an Account?",style:TextStyle(fontSize:16)),
                    const SizedBox(width:16),
                    LinkButton(
                      onPressed: (){},
                      text: "Log In"
                      )
                    
                  ],
                )
            ],
          ),
        )
      ),
    );
  }
}