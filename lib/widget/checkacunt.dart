import 'package:flutter/material.dart';

class checkacount extends StatelessWidget {
  const checkacount(
      {super.key, required this.checlsentence, required this.textbutton});
  final String checlsentence;
  final String textbutton;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 1,
        ),
        Text(
          checlsentence,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {
              if (textbutton == 'login') {
                Navigator.pop(context);
                
              } else if (textbutton == 'Register') {
                Navigator.pushNamed(context, '//');
              }
            },
            child: Text('$textbutton',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold))),
        Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
