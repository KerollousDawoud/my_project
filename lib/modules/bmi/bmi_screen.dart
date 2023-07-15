// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import, implementation_imports, unnecessary_import, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_brace_in_string_interps, unused_local_variable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_project/modules/bmi_result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
   
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  bool isMale = true;
  double hight = 120;
  int weight = 40 ;
  int age = 15 ;

  // Color color = Colors.grey.shade400;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale ? Colors.blue :Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('images/pngegg.png'),
                            width: 90,
                            height: 90,
                            ),
                           
                            // Icon(
                            //   Icons.male,
                            //   size: 90,
                            // ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !isMale ? Colors.blue : Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('images/female.png'),
                            width: 90,
                            height: 90,
                            ),
                            // Icon(
                            //   Icons.female,
                            //   size: 90,
                            // ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400],
                ),
                child: Column(
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${hight.round()}',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: hight,
                      min: 80,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          hight = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                            
                            ),
                          Text(
                            '${weight}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                heroTag: 'weight-',
                                mini: true,
                                child: Icon(Icons.remove),
                                ),
                                SizedBox(
                                  width: 10),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }, 
                                heroTag: 'weight+',
                                mini: true,
                                child: Icon(Icons.add),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                            ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                 setState(() {
                                   age--;
                                 });
                                },
                                heroTag: 'Age-',
                                mini: true,
                                child: Icon(Icons.remove),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: 'Age+',
                                mini: true,
                                child: Icon(Icons.add),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            child: MaterialButton(
              height: 50,
              onPressed: () {
                double result = weight / pow(hight / 100, 2.0);
                print(result.round());


                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => BMIResultScreen(
                      age: age,
                      isMale: isMale,
                      result: result.round(),
                    ),
                    ),
                  );
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
