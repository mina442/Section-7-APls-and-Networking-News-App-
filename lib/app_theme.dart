import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

enum AppTheme{
  lightTheme('light'),
  darkTheme('night');
  const AppTheme(this.name);
  final String name;
}
final appThemeData = { 
    AppTheme.lightTheme:ThemeData(
      primarySwatch: Colors.deepOrange,
     scaffoldBackgroundColor: Colors.white ,
     primaryColor: Colors.blue,
      appBarTheme: AppBarTheme(
                  titleSpacing:  20.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black,
                    ),
                     backgroundColor: Colors.white,
                     elevation: 0.0,
                      titleTextStyle: TextStyle(
                       color: Colors.black,
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                     ),
                      iconTheme: IconThemeData(
                       color: Colors.black,
                     ),),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                   type: BottomNavigationBarType.fixed,
                   selectedItemColor: Colors.deepOrange,
                   elevation: 20.0,
                   backgroundColor: Colors.white,
                   unselectedItemColor: Colors.grey,
                 ),
                   
  //                     textTheme: TextTheme(
  //                  bodyText1: TextStyle(
  //                      fontSize: 18,
  //                      fontWeight: FontWeight.w600,
  //                      color: Colors.black),
  // ),
  ),
   AppTheme.darkTheme:ThemeData( 
     scaffoldBackgroundColor: HexColor('333739'),
     primaryColor: Colors.deepPurpleAccent,
                   primarySwatch: Colors.deepOrange,
                   appBarTheme: AppBarTheme(
                     titleSpacing:  20.0,
                       systemOverlayStyle: SystemUiOverlayStyle(
                           statusBarColor: HexColor('333739'),
                           statusBarIconBrightness: Brightness.light),
                       backgroundColor: HexColor('333739'),
                       elevation: 0.0,
                       titleTextStyle: TextStyle(
                         color: Colors.black,
                         fontSize: 20.0,
                         fontWeight: FontWeight.bold,
                       ),
                       iconTheme: IconThemeData(
                         color: Colors.white,
                       )),
                   bottomNavigationBarTheme: BottomNavigationBarThemeData(
                       backgroundColor: HexColor('333739'),
                       unselectedItemColor: Colors.grey,
                       type: BottomNavigationBarType.fixed,
                       selectedItemColor: Colors.deepOrange[900],
                       elevation: 20.0),
                  //  textTheme: TextTheme(
                  //    bodyText1: TextStyle(
                  //        fontSize: 18,
                  //        fontWeight: FontWeight.w600,
                  //        color: Colors.white),)
                  )};