// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, implementation_imports, unused_import, unnecessary_import, camel_case_types, sort_child_properties_last, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, must_be_immutable, override_on_non_overriding_member, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class counterScreen extends StatelessWidget {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
          listener: (BuildContext context,CounterStates state)
          {
            if (state is CounterMinusState) 
            {
              print('minus state ${state.counter}');
            }
            if (state is CounterPlusState) 
            {
              print('plus state ${state.counter}');
            }
          },
          builder: (BuildContext context,CounterStates state) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'Counter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              body: Container(
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.blue,
                        width: 60,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            CounterCubit.get(context).minus();
                         
                          },
                          child: Icon(
                            Icons.exposure_minus_1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '${CounterCubit.get(context).counter}',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      CircleAvatar(
                        
                        radius: 30,
                        child: MaterialButton (
                          onPressed: () {
                         CounterCubit.get(context).Plus();
                          },
                          child: Icon
                          (
                           
                            size: 30,
                            Icons.exposure_plus_1,
                            color: Colors.white,
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
