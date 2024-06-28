import 'package:flutter/material.dart';

import 'package:firebase/All_packages.dart';


class optionPage extends StatefulWidget {
  const optionPage({super.key});

  @override
  State<optionPage> createState() => _optionPageState();
}

class _optionPageState extends State<optionPage> {
  late bool user_Registered=true;
  @override
  Widget build(BuildContext context) {
    return (user_Registered)?LoginPage(tap: toggle):RegisterPage(tap: toggle);
  }
  void toggle(){
    print('toogle called ');
    print(user_Registered);
    setState(() {
      user_Registered=!user_Registered;

    });
  }
}
