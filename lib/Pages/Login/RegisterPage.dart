import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Containers/LoginContainer.dart';

class RegisterPage extends StatelessWidget
{
  LoginContainerState superState;
  RegisterPage(this.superState);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final InputDecoration inputTheme = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder( borderRadius: BorderRadius.circular(20.0)),
  );

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
        Spacer(flex:2),
        TextField(controller: nameController, decoration: inputTheme,),
        Spacer(flex:1),
        TextField(controller: emailController, decoration: inputTheme,),
        Spacer(flex:1),
        TextField(controller: passwordController, decoration: inputTheme, obscureText: true, ),
        Spacer(flex:1),
        TextButton(
          child: const Text("Submit", style: TextStyle(color: Colors.black),),
          onPressed: (){
          superState.registerUser(
              nameController.value.text,
              emailController.value.text,
              passwordController.value.text
          );
          },
        ),
        TextButton(
          child: const Text("Back", style: TextStyle(color: Colors.black),),
          onPressed: (){superState.updateState(LoginPages.LoginPage);},),
      ],
    );
  }

}