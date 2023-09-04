// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print, empty_catches, empty_statements, body_might_complete_normally_catch_error, unused_import, depend_on_referenced_packages, prefer_typing_uninitialized_variables, body_might_complete_normally_nullable, avoid_unnecessary_containers, unused_label, dead_code, unused_element, avoid_types_as_parameter_names, non_constant_identifier_names, must_be_immutable, camel_case_types

import 'dart:ffi';

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_project/shared/components/components.dart';
import 'package:my_project/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../shared/cubit/cubit.dart';

class todoHomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: ConditionalBuilderRec(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screen[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                        title: cubit.titleController.text,
                        time: cubit.timeController.text,
                        date: cubit.dateController.text);
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.grey[100],
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormField(
                                    controller: cubit.titleController,
                                    type: TextInputType.text,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'title must not be empty';
                                      }
                                    },
                                    isPassword: false,
                                    label: 'tast title',
                                    prefix: Icons.title,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  defaultFormField(
                                      controller: cubit.timeController,
                                      type: TextInputType.datetime,
                                      onTap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          cubit.timeController.text =
                                              value!.format(context).toString();
                                          print(value.format(context));
                                        });
                                      },
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'time must not be empty';
                                        }
                                        return null;
                                      },
                                      label: 'tast time',
                                      isPassword: false,
                                      prefix: Icons.watch_later_outlined,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  defaultFormField(
                                      controller: cubit.dateController,
                                      type: TextInputType.datetime,
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime.parse(
                                                    '2023-07-01'))
                                            .then((value) {
                                          print(DateFormat.yMMMd()
                                              .format(value!));
                                          cubit.dateController.text =
                                              DateFormat.yMMMd().format(value);
                                        });
                                      },
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'date must not be empty';
                                        }
                                        return null;
                                      },
                                      label: 'tast date',
                                      isPassword: false,
                                      prefix: Icons.calendar_month,
                                      ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        elevation: 15,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue,
              currentIndex: cubit.currentIndex,
              fixedColor: Colors.white,
              ////دا بيحدد ليك انت هتبقي واقف علي انهي واحد يبقي by default
              //علي اول واحد اللي قيمته في ال index = 0
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.check_circle_outline,
                    ),
                    label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.archive,
                    ),
                    label: 'Archived'),
              ],
            ),
          );
        },
      ),
    );
  }
}
