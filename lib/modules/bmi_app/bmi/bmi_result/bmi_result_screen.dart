// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, implementation_imports, unused_import, unnecessary_import, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BMIResultScreen extends StatelessWidget 
{
  final int result;
  final bool isMale;
  final int age;

  BMIResultScreen(
    {
      required this.result,
      required this.isMale,
      required this.age,
    }
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          'Bmi Result'
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left
            ),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale ? 'Male' : 'Female'}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Result : $result',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
            Text(
              'Age : $age',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}