import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('home',style: TextStyle(
              fontSize: 60
            ),),
            IconButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              print('signout');
            }, icon: Icon(Icons.logout))
           ]
        )),
      ),
    );
  }
}
