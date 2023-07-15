// ignore_for_file: avoid_print, body_might_complete_normally_catch_error, unused_import, unnecessary_import, unnecessary_string_interpolations, curly_braces_in_flow_control_structures


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/modules/Todo_app/archived_tasks/archived_tasks_screen.dart';
import 'package:my_project/shared/cubit/state.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/Todo_app/done_tasks/done_tasks_screen.dart';
import '../../modules/Todo_app/new_tasks/new_tasks_screen.dart';
import '../components/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  int currentIndex = 0;

  List<Widget> screen = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen()
  ];
  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database ;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT , date TEXT , time TEXT , status TEXT)')
            .then((value) => () {
                  print('Table tasks created created');
                })
            .catchError((error) {
          print('Error When creating table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase(
      {
        required String title,
        required String time,
        required String date
      }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO tasks (title , date , time, status) VALUES("$title" , "$date" , "$time" ,"new")')
          .then((value) {
            titleController.text='';
            dateController.text='';
            timeController.text='';
        print('$value insert successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
        emit(AppGetDatabaseState());
      }).catchError((error) {
        print('Error When inserting New Record ${error.toString()}');
        return null;
      });
    });
  }

  void getDataFromDatabase(database)
  {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element)
      {
       if(element['status'] == 'new')
         newTasks.add(element);
       else if (element['status'] == 'done')
         doneTasks.add(element);
       else archivedTasks.add(element);
      });
      emit(AppGetDatabaseState());
    });
  }

  void updateData(
  {
    required String status,
    required int id,
  })
  async
  {
   database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id],
    ).then((value)
    {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });

  }
  void deleteData(
  {
    required int id,
  })
  async
  {
   database.rawDelete(
       'DELETE FROM tasks WHERE id = $id',

    ).then((value)
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });

  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());
  }


}
