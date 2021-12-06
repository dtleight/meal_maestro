import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'Containers/HomeContainer.dart';
import 'Containers/LoginContainer.dart';

User? authUser;
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  String? token = await FirebaseMessaging.instance.getToken();
  print("FIREBASE TOKEN: " + token!);
  FirebaseAuth.instance
      .authStateChanges()
      .listen((event){authUser = event;});
  runApp(MyApp());

}

class MyApp extends StatelessWidget
{
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Maestro',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
        //textTheme: TextTheme(bodyText1: TextStyle(),),
        inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          backgroundColor: Colors.black,
        ),

      ),
      debugShowCheckedModeBanner: false,
      home:authUser!=null?HomeContainer():LoginContainer(),
    );
  }
}

