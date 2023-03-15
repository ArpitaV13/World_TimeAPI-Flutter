import 'dart:convert';

import 'package:demo_fluttr/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='Loading';
  void setUpWorldTime() async{
   WorldTime instance= WorldTime(location:'Kolkata',flag:'Germany.png',url:'Asia/Kolkata');
   await instance.getTime();
   Navigator.pushReplacementNamed(context,'/home',arguments:{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDayTime':instance.isDayTime,
   });
   setState(() {
     time=instance.time;
   });
  }
void initState(){
  super.initState();
  setUpWorldTime();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
      child: SpinKitRotatingCircle(
      color: Colors.white,
      size: 50.0,
      ),
      ),
    );
  }
}