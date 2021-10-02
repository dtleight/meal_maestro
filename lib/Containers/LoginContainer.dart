import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Pages/Login/LoginPage.dart';
import '../Pages/Login/RegisterPage.dart';
import '../Pages/Login/EmailVerificationPage.dart';

class LoginContainer extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return LoginContainerState();
  }
}

class LoginContainerState extends State<LoginContainer>
{
  List<Widget> pages = [LoginPage(),RegisterPage(),EmailVerificationPage()];
  int index = 0;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      body: pages[index],
    );

  }

  void updateState()
  {
    setState((){});
  }

}

enum LoginContainerPages
{
  LoginPage,
  RegisterPage,
  EmailVerificationPage,
}

extension LoginContainerExtension on LoginContainerPages
{
  Widget get build {
    switch (this) {
      case LoginContainerPages.LoginPage:
        return LoginPage();
      case LoginContainerPages.RegisterPage:
        return RegisterPage();
      case LoginContainerPages.EmailVerificationPage:
        return EmailVerificationPage();
    }
  }

}