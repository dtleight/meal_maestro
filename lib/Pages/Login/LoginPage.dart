import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget
{
  final InputDecoration inputTheme = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder( borderRadius: BorderRadius.circular(20.0)),
  );


  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
        const Spacer(flex: 2,),
       TextField(
         controller: loginController,
         decoration: inputTheme,
       ),
       Spacer(flex: 1,),
       TextField(
         controller: passwordController,
         decoration: inputTheme,
         obscureText: true,
       ),
       Spacer(flex: 1,),
       TextButton(child: Text("Login", style: TextStyle(color: Colors.black),),onPressed: (){},),
       TextButton(child: Text("Register", style: TextStyle(color: Colors.black),), onPressed: (){},),
        Spacer(flex: 2,),

      ],
    );
  }

}