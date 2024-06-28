import 'package:firebase/pages/HomePage.dart';
import 'package:firebase/pages/aboutUser.dart';
import 'package:firebase/pages/registerOrlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase/All_packages.dart';


class AuthPage extends StatelessWidget {
  final String? email;
  const AuthPage({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
       body: StreamBuilder<User?>(
         stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context,snapshot){
            if(snapshot.hasData){
              return userdata(user: email,);
            }else{
              return optionPage();
            }
         }
       )
    );
  }
}
