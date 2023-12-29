import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app4/bloc_observer.dart';
import 'package:news_app4/dio_helper.dart';
import 'package:news_app4/layouts/home_page.dart';
import 'theme/bloc/theme_bloc.dart';


void main()  {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state is LoadedThemeState) {
              return MaterialApp(
                theme: state.themeData,
                debugShowCheckedModeBanner: false,
                title: 'Theme App',
                home: const NewsLayout(),
              );
            }
            return Container();
          },
        ));
  }
}
