// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),()
      {
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Color.fromARGB(255, 164, 82, 235),
                  Color.fromARGB(255, 34, 19, 110),
                  Color.fromARGB(255, 0, 0, 0),
                ],
                begin: FractionalOffset(1,0),
                end: FractionalOffset(0,1)
            )
        ),
        child: Center(
          child: Image.asset('assets/images/bodyLogo2.png', width: 300,height: 300,),
        ),
      ),
    );
  }
}