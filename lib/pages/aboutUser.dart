import 'package:firebase/All_packages.dart';
import 'package:firebase/databaseFunction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class userdata extends StatefulWidget {
   final String? user;
  const  userdata({super.key,required this.user});

  @override
  State<userdata> createState() => _userdataState();
}

class _userdataState extends State<userdata> {
  var  name=null;
  var  Gender=null;
  var  age=null;
bool user_Registered=true;
  void toggle(){
    print('toogle called ');
    print(user_Registered);
    setState(() {
      user_Registered=!user_Registered;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(child: Text('About')),
        actions: [
          IconButton(onPressed: () {

            setState(() {
              FirebaseAuth.instance.signOut();
            });

            //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(tap: toggle),));
          }, icon: const Icon(Icons.arrow_back_sharp))
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.grey[250],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Container(
                  color: Colors.blueGrey,
                  height: 200,
                  child: Center(
                    child: CircleAvatar(
                       radius: 50,
                      backgroundColor: Colors.yellow,
                      child: Icon(Icons.person,size: 60,),
                    ),
                  ),
                ),
              SizedBox(height: 10,),
              Text('About',
                style: TextStyle(
                  fontSize: 30
                ),
              ),
              ListTile(
                leading: Text('name:',
                style: TextStyle(
                  fontSize: 15
                ),
                ),
                title: Text((name==null)?'name':name),
              ),
              ListTile(
                leading: const Text('age',
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
                title: Text((age==null)?'age':age.toString()),
              ),
              ListTile(
                leading: const Text('gender',
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
                title: Text((Gender==null)?'gender':Gender)
              ),

            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white60,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed:
                  () async {
                    var data = await Retrive(widget.user);
                setState(() {

                  print(data?['name']);
                  print(data?['age']);
                  print(data?['Gender']);
                  name = data?['name'];
                  age = data?['age'];
                  Gender = data?['Gender'];
                });

              }, style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 37
                  )
              ),
                  child: Text(((name == null) ? 'Get ' : 'see'))
              )
            ],
          ),
        ),
      ),
    );
  }

}
