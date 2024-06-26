import 'package:firebase/pages/google_servies.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase/All_packages.dart';

class LoginPage extends StatefulWidget {
  final Function()? tap;
  const LoginPage({super.key,required this.tap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  //creating controller
  final _email = TextEditingController();
  final _pass = TextEditingController();

  //
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
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                       auth();
                    });

                  },
                  style: ButtonStyle(
                    backgroundColor:
                    WidgetStateProperty.all(Colors.blue.withRed(5)),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
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
                    sqrTile(url: 'assets/img_3.png',tap: googleServices().signInWithGoogle,),
                    SizedBox(width: 50,),
                    sqrTile(url: 'assets/img_4.png',tap: googleServices().signInWithGoogle,)
                  ],
                ),
                const SizedBox(height: 80),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    GestureDetector(
                       onTap: widget.tap!,
                     child:  Text(
                        ' Register',
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

 void  auth() async{
    showDialog(context: context, builder: (context){
          return Center(
            child: CircularProgressIndicator(),
          );
    });
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _pass.text);
          Navigator.pop(context);
    }on FirebaseAuthException catch(e){
      showError(e.code);
    }

  }

  void showError(String e) {
      Navigator.pop(context);

      final snakbar=SnackBar(content: Center(child: Text(e)),
        duration: Duration(seconds: 1),
     behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snakbar);
  }

}



