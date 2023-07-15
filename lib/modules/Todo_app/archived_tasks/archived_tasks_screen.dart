// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/shared/cubit/state.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';

class ArchivedTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context, state) {},
      builder: (context , state)
      {
        var tasks = AppCubit.get(context).archivedTasks;
        return tasksBuilder(
          tasks: tasks,
        );
      },
    );
  }
}