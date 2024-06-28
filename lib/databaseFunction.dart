

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

create (String _name,_gender,int _age,_user)async{
  await FirebaseFirestore.instance.collection('instagram').doc(_user).set({
    'name':_name,
    'Gender':_gender,
    'age':_age
  });
  print('database created');
}
update()async{
  await FirebaseFirestore.instance.collection('instagram').doc('cat').update({
    'age':23
  });
  print('data updated');
}
Delete()async{
  await FirebaseFirestore.instance.collection('pets').doc('cat').delete();
  print("delete");

}
Future<Map<String, dynamic>?> Retrive(String? user) async{
  var User="user";
  (user != null)?User=user:User="user";
  var data=await FirebaseFirestore.instance.collection('instagram').doc(User).get();
  print('data retrived');
  // return data.data();
  //print((data.data())?["name"]);
  //print(data.data()?[dataType]);
  return ((data.data()));
}
