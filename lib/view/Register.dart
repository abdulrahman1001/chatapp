import 'package:chatapp/constatnt.dart';
import 'package:chatapp/widget/authintbody.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colorback),
      body:authintictionbody(namepage: 'Register',secpage: 'login',)
    );
  }
}