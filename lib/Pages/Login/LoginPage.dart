import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Containers/LoginContainer.dart';

class LoginPage extends StatelessWidget
{
  LoginContainerState superState;
  LoginPage(this.superState);
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
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextButton(
             child: Image.network("https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png", height: 50, width: 50,),
             onPressed: ()async {await superState.signInWithGoogle();print("Signed in");superState.checkRegistrationStatus();},
           ),
           ],
       ),
       TextButton(
         child: Text("Login", style: TextStyle(color: Colors.black),),
         onPressed: (){ superState.login(loginController.value.text,passwordController.value.text);},),
       TextButton(
            child: Text("Register",
            style: TextStyle(color: Colors.black),),
            onPressed: (){ superState.updateState(LoginPages.RegisterPage);},
       ),
        Spacer(flex: 2,),

      ],
    );
  }

}