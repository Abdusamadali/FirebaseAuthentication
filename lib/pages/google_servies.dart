import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class googleServices{
  BuildContext context;
googleServices({required this.context});
signInWithGoogle()async{
      // final googleSignin=GoogleSignIn();
      // GoogleSignIn ? User;
      // GoogleSignInAccount  user = User as GoogleSignInAccount;

    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator());
    });

      //begin interactive sign in process
    final GoogleSignInAccount? gUser= await GoogleSignIn().signIn();


    //obtain auth details from request
   final GoogleSignInAuthentication gAuth=await gUser!.authentication;


    //create a new credentials for user
    final credential=GoogleAuthProvider.credential(
      accessToken:gAuth.accessToken,
      idToken: gAuth.idToken
    );


    //print("---------------------------------------------$credential");

  //  print("----------------------------------====$GoogleSignInAccount");
    Navigator.pop(context);
      //finally, let's the user sign in


    var h = await FirebaseAuth.instance.signInWithCredential(credential);
    String? userEmail = h.user?.email;

    print("---------------------------------------------${userEmail}");
}
}