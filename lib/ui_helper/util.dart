// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

TextStyle mainHeading() {
  return TextStyle(
    fontSize: 44,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}

TextStyle h1() {
  return TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
}

TextStyle h2(color) {
  return TextStyle(
    fontSize: 22,
    color: color,
    fontWeight: FontWeight.w400,
  );
}
TextStyle h3() {
  return TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
}

TextStyle subText1White() {
  return TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
}

TextStyle subText1Green() {
  return TextStyle(
    fontSize: 16,
    color: Color(0xff31e170),
    fontWeight: FontWeight.w400,
  );
}

TextStyle subText1Purple() {
  return TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 164, 82, 235),
    fontWeight: FontWeight.w400,
  );
}

TextStyle subText1Grey() {
  return TextStyle(
    fontSize: 16,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  );
}
TextStyle subText2(color) {
  return TextStyle(
    fontSize: 12,
    color: color,
    fontWeight: FontWeight.w400,
  );
}

ButtonStyle primaryBtn() {
  return ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 164, 82, 235),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24), // Adjust roundness
    ),
  );
}

ButtonStyle secondaryBtn() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    // border: Border.all(color: Color(0x545771F3)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
      side: BorderSide(color: Color.fromARGB(255, 164, 82, 235)),
    ),
  );
}

RadialGradient radialBackground() {
  return RadialGradient(
      colors: [
        Color.fromARGB(255, 164, 82, 235),
        Color.fromARGB(255, 0, 0, 0),
        Color.fromARGB(255, 0, 0, 0),
        Color.fromARGB(255, 0, 0, 0),
        Color.fromARGB(255, 34, 19, 110),
      ],
      center: Alignment.topRight,
      radius: 2,
      stops: [0, 0.25, 0.60, 0.8, 1]);
}

BoxDecoration boxDecoration() {
  return BoxDecoration(
      color: Color.fromARGB(255, 60, 83, 218).withAlpha(34),
      //option for lighter container bg
      //color: Color.fromARGB(34, 164, 175, 234),
      border: Border.all(
        // color: Color(0x545771F3),
          color: Color.fromARGB(255, 60, 83, 218),
          width: 2),
      borderRadius: BorderRadius.circular(24));
}

TextField ipTextField(
    {required controller, required String suffixText}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0x40a4afea),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: Color(0x545771F3),
            width: 2,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 164, 82, 235),
            width: 2,
          )),
      // labelText: 'Years', labelStyle: subText1(),
      suffixText: suffixText, suffixStyle: subText1Grey(),
    ),
  );
}

Visibility warning({required bool visible}){
  return Visibility(
    visible: visible,
    child: Text(
      'Please fill the entries with valid digits!!',
      style: TextStyle(fontSize: 16, color: Colors.red), textAlign: TextAlign.center,
    ),
  );
}
