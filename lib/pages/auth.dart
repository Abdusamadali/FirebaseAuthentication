import 'package:firebase/pages/HomePage.dart';
import 'package:firebase/pages/registerOrlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase/All_packages.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: StreamBuilder<User?>(
         stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context,snapshot){
            if(snapshot.hasData){
              return Home();
            }else{
              return optionPage();
            }
         }
       )
    );
  }
}
