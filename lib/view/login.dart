import 'package:chatapp/widget/authintbody.dart';
import 'package:flutter/material.dart';

class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b475e),
      body: authintictionbody(
        namepage: 'login',
        secpage: 'Register',
      ),
    );
  }
}

