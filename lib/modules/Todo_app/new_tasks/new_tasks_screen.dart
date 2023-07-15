// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_print, dead_code, curly_braces_in_flow_control_structures, prefer_is_empty

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/shared/components/components.dart';
import 'package:my_project/shared/cubit/cubit.dart';
import 'package:my_project/shared/cubit/state.dart';

class NewTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context, state) {},
      builder: (context , state)
      {
        var tasks = AppCubit.get(context).newTasks;
        return tasksBuilder(
            tasks: tasks,
        );
      },
    );

  }
}