// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text('My App'),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_important),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 20,
      ),
            // تستخدم ال SafeArea لو مفيش ال AppBar
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'first',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
              ),
            ),
            Text(
              'Second',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
              ),
            ),
            Text(
              'third',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
              ),
            ),
            Text(
              'third',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
              ),
            ),
            Text(
              'fourth',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
