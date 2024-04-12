import 'package:flutter/material.dart';

class editbuttomsheet extends StatelessWidget {
  const editbuttomsheet({super.key, required this.onchange});
final void Function(String) onchange;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Edit Text',
            ),
            onChanged: onchange,
            
          ),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Edit'))
        ],
      ),
    );
  }
}