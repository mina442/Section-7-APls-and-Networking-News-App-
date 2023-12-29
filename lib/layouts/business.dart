import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app4/components.dart';
import 'package:news_app4/cubit/cubit.dart';
import 'package:news_app4/cubit/state.dart';

class BusinessLayout extends StatelessWidget {
  const BusinessLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var List = NewsCubit.get(context).business;
        return articleBuild(List,context);
        },
    );
  }
}