// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_is_empty, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/layout/news_app/cubit/cubit.dart';
import 'package:my_project/layout/news_app/cubit/states.dart';
import 'package:my_project/shared/components/components.dart';
class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context, state) {} ,
      builder: (context , state)
      {
        var list = NewsCubit.get(context).science;

        return articleBuilder(list,context);
      },

    );
  }
}
