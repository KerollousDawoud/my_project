// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile User',
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),

        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(),
            ],
          ),
        ],
      ),
    ) ;
  }
}





























