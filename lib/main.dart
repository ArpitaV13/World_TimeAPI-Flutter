import 'package:flutter/material.dart';
import 'package:demo_fluttr/pages/home_page.dart';
import 'package:demo_fluttr/pages/loading.dart';
import 'package:demo_fluttr/pages/choose_location.dart';
void main() {
  runApp( MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=> Home(),
      '/choose_location':(context)=>choose_location(),
    },
  ));
}


