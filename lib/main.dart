import 'package:flutter/material.dart';
import 'package:live_chat/screens/auth_screen.dart';
import 'package:live_chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_chat/screens/splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.purple,
        backgroundColor: Colors.deepOrangeAccent,
        accentColorBrightness:Brightness.dark ,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.purple,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        )
      ),
      home: StreamBuilder(stream:FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot){
        if(userSnapshot.connectionState == ConnectionState.waiting){
          return SplashScreen();
        }
        if(userSnapshot.hasData){
          return ChatScreen();
        }
        return AuthScreen();
        },),
    );
  }
}
