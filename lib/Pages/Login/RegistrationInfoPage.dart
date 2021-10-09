import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Containers/LoginContainer.dart';

class RegistrationInfoPage extends StatelessWidget
{
  LoginContainerState superState;
  RegistrationInfoPage(this.superState);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController birthdateController = TextEditingController();
  final InputDecoration inputTheme = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder( borderRadius: BorderRadius.circular(20.0)),
  );

  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: birthdateController, decoration: inputTheme,),
            Spacer(flex:1),
        TextButton(
          onPressed: () async {
            var bv = birthdateController.value.text.split("/");
            superState.createUser(
                DateTime(int.parse(bv[2]), int.parse(bv[0]), int.parse(bv[1])),
            );
          },
          child: Text("Register"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        ),
        TextButton(
          onPressed: () {
            superState.updateState(LoginPages.LoginPage);
          },
          child: Text("Back"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        )
      ]),
    );
  }
}