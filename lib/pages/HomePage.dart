import 'dart:async';
import 'dart:ui';

import 'package:firebase/pages/aboutUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../databaseFunction.dart';


class Home extends StatefulWidget {
  final String? email;
  const Home(  {super.key,required this.email});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _name=TextEditingController();
  var _age=TextEditingController();
  var _gender=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Fire Store')),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0,right: 30),
                    child: TextField(
                      controller: _name,
                     decoration:  InputDecoration(
                       hintText: 'name',
                        border: OutlineInputBorder(
                       //   borderSide: BorderSide(width: 20,color: Colors.red),
                       //   borderRadius: BorderRadius.circular(39)
                       ),
                     ),
                    ),
                  ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: TextField(
                  controller: _age,
                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(
                    hintText: 'age',
                    border: OutlineInputBorder(
                       borderSide: BorderSide(width: 20,color: Colors.red),
                    //   borderRadius: BorderRadius.circular(39)
                   ),
                  ),

                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30),
                child: TextField(
                  controller: _gender,
                  decoration:  InputDecoration(
                    hintText: 'gender',
                     border: OutlineInputBorder(
                    //   borderSide: BorderSide(width: 20,color: Colors.red),
                    //   borderRadius: BorderRadius.circular(39)
                     ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                final name = _name.text;
                final gender = _gender.text;
                final age = int.tryParse(_age.text);
                final user="email: ${widget.email}";
                create(name, gender,age! ,user);
                Navigator.push(context, MaterialPageRoute(builder: (context) => userdata(user: user,),));
              }, child: Text('submit'))
            ],
          ),
        ),
      )
    );
  }
}
