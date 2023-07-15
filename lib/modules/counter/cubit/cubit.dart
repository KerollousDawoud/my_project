// ignore_for_file: unused_import, unnecessary_import, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/modules/counter/cubit/states.dart';


class CounterCubit extends Cubit<CounterStates> {
  CounterCubit () : super(CounterInitialState());


  static CounterCubit get (context) => BlocProvider.of(context);
  int counter = 1; 

  void minus () {
    counter--;
    emit(CounterMinusState(counter));
  }
  void Plus () {
    counter++;
    emit(CounterPlusState(counter));
  }

} 