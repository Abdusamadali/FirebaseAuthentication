import 'package:firebase/pages/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase/All_packages.dart';

import 'google_servies.dart';

class RegisterPage extends StatefulWidget {
  final Function()? tap;
  const RegisterPage({super.key,required this.tap});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {


  //creating controller
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _conf_pass=TextEditingController();

  //password visibility
  bool see = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              tileMode: TileMode.mirror,
              end: Alignment.bottomRight,
              colors: [
                Colors.pink,
                Colors.purpleAccent,
                Colors.red,
                Colors.orange
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock_outline,
                  size: 60,
                ),
                const SizedBox(height: 70),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _email,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Email",
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _pass,
                    obscureText: see,
                    obscuringCharacter: "*",
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            see = !see;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye_rounded),
                      ),
                      hintText: "Password",
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _conf_pass,
                    obscureText: see,
                    obscuringCharacter: "*",
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            see = !see;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye_rounded),
                      ),
                      hintText: "confirm Password",
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 15),
                SizedBox(
                  height: 45,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        signup();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      WidgetStateProperty.all(Colors.blue.withRed(5)),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 60,
                        indent: 9,
                        endIndent: 8,
                      ),
                    ),
                    Text('or continue with'),
                    Expanded(
                      child: Divider(
                        indent: 8,
                        endIndent: 9,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    sqrTile(url: 'assets/img_3.png',tap :googleServices(context: context).signInWithGoogle),
                    SizedBox(width: 50,),
                    sqrTile(url: 'assets/img_4.png',tap: googleServices(context: context).signInWithGoogle,)
                  ],
                ),
                const SizedBox(height: 80),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('have an accunt?'),
                    GestureDetector(
                      onTap: widget.tap,
                      child: Text(
                        ' Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signup() async {

    //showing circle progess indicator
    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator());
    });

    try{
      if(_pass.text !=_conf_pass.text){
        showError("different confirm password");
      }
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _pass.text);
      print("-------------------${user}.");
      showDialog(context: context, builder: (context) {
         return AlertDialog(title: Text('accunt created'),
        backgroundColor:Colors.pink,
        );
      },);
      Navigator.pop(context);
      FirebaseAuth.instance.signOut();
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(email: _email.text)));
    }on FirebaseException catch(e){
    showError(e.code);
    }
  }
  void showError(String e){
    Navigator.pop(context);
   final snackbar=SnackBar(
       content: Text(e),
     duration: Duration(seconds: 1),
   );
   ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}




