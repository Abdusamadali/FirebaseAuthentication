import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class googleServices{
  Future<UserCredential> signInWithGoogle()async{
      // final googleSignin=GoogleSignIn();
      // GoogleSignIn ? User;
      // GoogleSignInAccount  user = User as GoogleSignInAccount;

      //begin interactive sign in process
    final GoogleSignInAccount? gUser= await GoogleSignIn().signIn();


      //obtain auth details from request
    final GoogleSignInAuthentication gAuth=await gUser!.authentication;

      //create a new credentials for user
    final credential=GoogleAuthProvider.credential(
      accessToken:gAuth.accessToken,
      idToken: gAuth.idToken
    );

      //finally, let's the user sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}