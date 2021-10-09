import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_maestro/Containers/HomeContainer.dart';
import '../Pages/Login/LoginPage.dart';
import '../Pages/Login/RegisterPage.dart';
import '../Pages/Login/EmailVerificationPage.dart';
import '../Pages/Login/RegistrationInfoPage.dart';

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
  int index = 0;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      body: LoginPages.values[index].build(this),
    );

  }

  void updateState(LoginPages page)
  {
    setState((){index = page.index;});
  }

  ///Creates a navigation route to the home page and clears the navigation stack.
  void moveToHomePage() async
  {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (ctxt) {
        return HomeContainer();
      },
    ), (Route<dynamic> route) => false);
  }

  ///Checks if the user has an account already in the database otherwise it brings the user to the registration page
  void checkRegistrationStatus() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("users");
    DocumentSnapshot snapshot = await collectionReference.doc(uid).get();
    if (snapshot
        .exists) //An account exists for this user, query data from the database
        {
      List<dynamic> items = [];
      items.map((e) => e as int);
      moveToHomePage();
    } else {
      updateState(LoginPages.RegistrationInfoPage);
    }
  }

  //Might be beneficial to move to LoginContainer
  Future<bool> registerUser(String name, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      //FirebaseAnalytics().logSignUp(signUpMethod: signInMethod);
      updateState(LoginPages.RegistrationInfoPage);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case "email-already-in-use":
          {
            print("Bad");
          }
          break;
        case "invalid-email":
          {
            print("Bad");
          }
          break;
      }
      return false;
    }
  }

  /// instantiate a user
  void createUser(DateTime birthdate,) {
    String? uid = FirebaseAuth.instance.currentUser!.uid;
    String? name = FirebaseAuth.instance.currentUser!.displayName;
    String? email = FirebaseAuth.instance.currentUser!.email;
    FirebaseFirestore.instance.collection("users").doc(uid).set(
      {
        'name': name,
        'email': email,
        'birthdate': birthdate,
        'recipes': [],
        'pantry':[],
      },
    );

    moveToHomePage();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  ///Attempts to sign in with username and password
  void login(String email, String password) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //Possible redundancy
      checkRegistrationStatus();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.'); //BRB
      }
    }
  }

}

enum LoginPages
{
  LoginPage,
  RegisterPage,
  RegistrationInfoPage,
  EmailVerificationPage,
}

extension LoginContainerExtension on LoginPages
{
  Function get build {
    switch (this) {
      case LoginPages.LoginPage:
        return (LoginContainerState state) => LoginPage(state);
      case LoginPages.RegisterPage:
        return (LoginContainerState state) => RegisterPage(state);
      case LoginPages.RegistrationInfoPage:
        return (LoginContainerState state) => RegistrationInfoPage(state);
    }
    return () => null;
  }

}