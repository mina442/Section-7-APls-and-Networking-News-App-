import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app4/components.dart';
import 'package:news_app4/cubit/cubit.dart';
import 'package:news_app4/cubit/state.dart';
import 'package:news_app4/dio_helper.dart';
import 'package:news_app4/search.dart';
import 'package:news_app4/settings_page.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
      create: (context) => NewsCubit()..getBusiness()..getSciences()..getSports(),
      child:BlocConsumer<NewsCubit,NewsStates>(
        
        listener: (context, state) {
          
        },
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return  Scaffold(
       appBar: AppBar(
         title: cubit.titles[cubit.currentIndex],
         actions: <Widget>[
           IconButton(
             color: Colors.black,
             icon:  Icon(Icons.settings),
             onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(
                 builder: (context) => const SettingsPage(),
               ),
               );
             },
           ),
           IconButton(
             color: Colors.black,
             icon:  Icon(Icons.search),
             onPressed: () {
               navigateTo(context, SearchLayout(),
               );
             },
           ),
         ],
       ),
      //  floatingActionButton: FloatingActionButton(
      //   onPressed: () {
          
      //   }
      //  ),
       bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          cubit.changeBottomNavBar(index);
        },
          currentIndex: cubit.currentIndex ,
         items: cubit.bottomItems),
       body: cubit.screens[cubit.currentIndex]
     );


        },
         ) ,
      )
      ;
        }
}

            
          
      
