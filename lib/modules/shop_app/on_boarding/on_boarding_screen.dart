// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On Boarding Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage('assets/images/Shopping1.png'),
          ),
        ],
      ),
    );
  }
}
