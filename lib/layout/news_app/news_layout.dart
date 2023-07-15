// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_import, avoid_print

import  'package:flutter/material.dart';
import  'package:flutter/widgets.dart';
import  'package:flutter_bloc/flutter_bloc.dart';
import  'package:my_project/layout/news_app/cubit/cubit.dart';
import  'package:my_project/layout/news_app/cubit/states.dart';
import 'package:my_project/modules/search/search_screen.dart';
import 'package:my_project/shared/components/components.dart';
import 'package:my_project/shared/cubit/cubit.dart';
import  'package:my_project/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class NewsLayout extends StatelessWidget
{
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit , NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('News Screen'),
              actions:
              [
                IconButton(
                    onPressed: ()
                    {
                      navigateTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).changeNewsMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)
                ),
              ],
            ),

            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar( 
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItem,
            ),
          );
        },

      );
  }
}
