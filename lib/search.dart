import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app4/components.dart';
import 'package:news_app4/cubit/cubit.dart';
import 'package:news_app4/cubit/state.dart';

class SearchLayout extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(title: Text('Setting Mode')),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Search',
                      labelText: 'Search',
                    ),
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Search must not be empty';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                  ),
                ),
                Expanded(child: articleBuild(list, context,isSearch: true)),
              ],
            ),
          );
        },
      ),
    );
  }
}
