// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
            'Settings Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
    );
  }
}
