// ignore_for_file: use_key_in_widget_constructors, implementation_imports, camel_case_types, prefer_const_constructors, unused_import, unnecessary_import, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../models/user/user_model.dart';

class usersScreen extends StatelessWidget 
{
  List<UserModel> users = [
    UserModel(
      id:2,
      name: 'kerollous Dawoud',
      phone: '01093542606', 
    ),
     UserModel(
      id:3,
      name: 'Dawoud Aziz',
      phone: '12345679876', 
    ),
     UserModel(
      id:4,
      name: 'shenoda Dawoud',
      phone: '0987654317654', 
    ),
     UserModel(
      id:5,
      name: 'mina dawoud',
      phone: '98765432567', 
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'USERS'
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]), 
        separatorBuilder: ((context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        )
        ), 
        itemCount: users.length,
        ),
    );
  }

  Widget buildUserItem(UserModel users) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Text(
                '${users.id}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${users.name}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${users.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                    ),
                )
              ],
            ),
          ],
        ),
      );
}