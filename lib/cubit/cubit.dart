 import 'package:flutter/material.dart';
import 'package:news_app4/cubit/state.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app4/dio_helper.dart';
import 'package:news_app4/layouts/business.dart';
import 'package:news_app4/layouts/sciense.dart';
import 'package:news_app4/layouts/sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;
   List<Text> titles = [
Text('Business'),
Text('Sports'),
Text('Science'),

   ];
   List<Widget> screens = [
    BusinessLayout(),
    SportsLayout(),
    ScienceLayout()
   ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),

  ];
  void changeBottomNavBar(int index){
currentIndex = index;
emit(NewsBottomNavState());
  }
List<dynamic> business = [];
  void getBusiness(){
     emit(NewsGetBusinessLoading());
 //    if(business.length == 0){
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '36a894cc08124ffa9690ff4a1ee7296e'
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessError(error.toString()));
    });
    //}else {
  //    emit(NewsGetBusinessSuccess());
  //  }
  }

    List<dynamic> Sports = [];
  void getSports() {
    emit(NewsGetSportsLoading());
    //if (Sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '36a894cc08124ffa9690ff4a1ee7296e'
      }).then((value) {
        Sports = value.data['articles'];
        print(Sports[0]['title']);
        emit(NewsGetSportsSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsError(error.toString()));
      });
    // } else {
    //   emit(NewsGetSportsSuccess());
    // }
  }
    List<dynamic> science = [];
  void getSciences(){
     emit(NewsGetSciencesLoading());
    //  if(Sciences.length == 0){
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '36a894cc08124ffa9690ff4a1ee7296e'
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetSciencesSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSciencesError(error.toString()));
    });
    // }else {
    //   emit(NewsGetSciencesSuccess());
    // }
  }
List<dynamic> search = [];
  void getSearch(String value){
     emit(NewsGetSearchLoading());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '36a894cc08124ffa9690ff4a1ee7296e'
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchError(error.toString()));
    });}

   }