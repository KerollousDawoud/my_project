// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_import, use_key_in_widget_constructors, override_on_non_overriding_member, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_project/layout/news_app/cubit/cubit.dart';
import 'package:my_project/layout/news_app/news_layout.dart';
import 'package:my_project/layout/todo_app/todo_layout.dart';
import 'package:my_project/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:my_project/shared/cubit/cubit.dart';
import 'package:my_project/shared/cubit/state.dart';
import 'package:my_project/shared/network/local/cache_helper.dart';
import 'package:my_project/shared/network/remote/dio_helper.dart';
import 'package:my_project/shared/styles/themes.dart';
import 'package:provider/provider.dart';
import 'layout/news_app/cubit/states.dart';
import 'modules/basics/login/login_screen.dart';
import 'modules/basics/messanger/messenger_screen.dart';
import 'modules/counter_app/counter/counter_screen.dart';
import 'modules/basics/users/users_screen.dart';
import 'modules/bmi_app/bmi/bmi_result/bmi_result_screen.dart';
import 'modules/basics/home/home_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'shared/bloc_observer.dart';
import 'package:dio/dio.dart';

void main() async
{
  //بيتأكد ان كل حاجة خلصت هنا في الميثود وبعدبن يفتح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark') ?? false ;

  runApp(MyApp(isDark!)); // ignore: unnecessary_non_null_assertion
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NewsCubit>(
          create: (_) => NewsCubit()..getBusiness()..changeNewsMode(
              fromShared: isDark,
          ),
        ),
      ],
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
            NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}