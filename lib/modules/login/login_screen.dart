// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:my_project/shared/components/components.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 10,
        title: Text(
          'Kerollous',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 45,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  defaultFormField(
                    isPassword: false,
                    controller: userNameController,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Email must not be empty';
                      }
                      return null;
                    },
                    label: 'Email',
                    prefix: Icons.email,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    label: 'Password',
              
                    prefix: Icons.lock,
                    suffix:isPassword ? Icons.visibility : Icons.visibility_off,
                    isPassword: isPassword,
                    suffixPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                    type: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
              
                    text: 'Login',
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(userNameController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
              
                    background: Colors.red,
                    width: double.infinity,
                    isUpperCase: false,
                    function: () {
                      print(userNameController.text);
                      print(passwordController.text);
                    },
                    text: 'Register',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {},
                        child: Text('Register Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}