import 'package:chatapp/widget/checkacunt.dart';
import 'package:chatapp/widget/form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authintictionbody extends StatefulWidget {
  const authintictionbody({
    super.key,
    required this.namepage,
    required this.secpage,
  });
  final String namepage;
  final String secpage;

  @override
  State<authintictionbody> createState() => _authintictionbodyState();
}

class _authintictionbodyState extends State<authintictionbody> {
  @override
  Widget build(BuildContext context) {
     String password='';
     String email='';
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/scholar.png'),
            Text(
              'scholar chat',
              style: TextStyle(
                  fontSize: 40, color: Colors.white, fontFamily: 'Pacifico'),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              widget.namepage,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
         FormAuth(namepage: widget.namepage, secpage: widget.secpage)
           
          ],
        ),
      ),
    );
  }
}
