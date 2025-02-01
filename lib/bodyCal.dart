// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:body_cal/pages/bmiCal.dart';
import 'package:body_cal/pages/dashboard.dart';
import 'package:body_cal/pages/megaCal.dart';
import 'package:body_cal/pages/proteinCal.dart';
import 'package:body_cal/pages/waterCal.dart';
// import 'package:body_cal/pages/splash_page.dart';

void main(){
  runApp(BodyCal());
}

class BodyCal extends StatelessWidget{
  const BodyCal({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
      routes: {
        '/waterCal':(context)=> WaterCal(),
        '/bmiCal':(context)=>BmiCal(),
        '/dashboard':(context)=>Dashboard(),
        '/proteinCal':(context)=>proteinCal(),
        '/megaCal':(context)=>megaCal(),
      },
    );
  }
}