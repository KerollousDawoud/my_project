// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/layout/news_app/cubit/cubit.dart';
import 'package:my_project/layout/news_app/cubit/states.dart';
import 'package:my_project/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  final darkTextFieldStyle = TextStyle(
    color: Colors.white24,
    fontSize:18,
    fontWeight: FontWeight.bold
  );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    isPassword: false,

                    type: TextInputType.text,
                    onChanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'search must not be Empty';
                      }
                      return null;
                    },
                    label: 'Search',
                    prefix: Icons.search,
                    darkModeTextStyle: darkTextFieldStyle,
                ),
              ),
              Expanded(
                child: articleBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
