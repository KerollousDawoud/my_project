// ignore_for_file: prefer_const_constructors, avoid_print, curly_braces_in_flow_control_structures, prefer_is_empty, unused_import, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/layout/news_app/cubit/states.dart';
import 'package:my_project/modules/business/business_screen.dart';
import 'package:my_project/modules/science/science_screen.dart';
import 'package:my_project/modules/sports/sports_screen.dart';
import 'package:my_project/shared/network/local/cache_helper.dart';
import 'package:my_project/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '3b4eda70cf1e4388b860c3a5cd41ded4'
    }).then((value) {
      // print(value?.data['articles'][0]['title']);
      business = value?.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());

    if (sports.length == 0) {
      DioHelper dioHelper = DioHelper();
      dioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sport',
        'apiKey': '3b4eda70cf1e4388b860c3a5cd41ded4'
      }).then((value) {
        // print(value?.data['articles'][0]['title']);
        sports = value?.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper dioHelper = DioHelper();
      dioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '3b4eda70cf1e4388b860c3a5cd41ded4'
      }).then((value) {
        // print(value?.data['articles'][0]['title']);
        science = value?.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];

    if (search.length == 0) {
      DioHelper dioHelper = DioHelper();
      dioHelper.getData(url: 'v2/everything', query: {
        'q': '$value',
        'apiKey': '3b4eda70cf1e4388b860c3a5cd41ded4'
      }).then((value) {
        // print(value?.data['articles'][0]['title']);
        search = value?.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSearchSuccessState());
    }
  }

  bool isDark = false;

  void changeNewsMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;

      emit(NewsChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }
  }
}
