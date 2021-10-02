import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget
{
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
       TextField(controller: loginController,),
       TextField(controller: passwordController, obscureText: true, ),
       TextButton(child: Text("Login"),onPressed: (){},),
       TextButton(child: Text("Register"), onPressed: (){},),

      ],
    );
  }

}