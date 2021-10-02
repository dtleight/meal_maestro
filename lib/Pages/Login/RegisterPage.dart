import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget
{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
        TextField(controller: emailController,),
        TextField(controller: passwordController, obscureText: true, ),
        TextButton(child: const Text("Login"),onPressed: (){},),
        TextButton(child: const Text("Register"), onPressed: (){},),
      ],
    );
  }

}