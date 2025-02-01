// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:body_cal/ui_helper/util.dart';
import 'package:body_cal/pages/bmiResult.dart';


class BmiCal extends StatefulWidget{
  const BmiCal({super.key});

  @override
  State<BmiCal> createState() => _BmiCalState();
}

class _BmiCalState extends State<BmiCal> {
  var ageController = TextEditingController();
  var weightController = TextEditingController();
  var genderController = TextEditingController();
  var heightController = TextEditingController();

  bool warningOpt = false;

  bool isAgePos=false;
  bool isWeightPos=false;
  bool isHeightPos=false;

  String? _selectedGender;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: radialBackground(),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                        color:Colors.white,
                        size:30,),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 30,),
                    Text('BMICal', style: h1(),)
                  ],
                ),
              ),
              SizedBox(height: 50,),
              SizedBox(width: 378,height: 27,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Text('Enter your Details:',style: h2(Colors.white),textAlign: TextAlign.left,),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    width: 378,
                    decoration: boxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Gender',style: h2(Colors.white),),
                          SizedBox(height: 10,),
                          Wrap(
                            spacing:20,
                            runSpacing: 20,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedGender = _selectedGender =='male'? null: 'male';
                                  });
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: _selectedGender == 'male'
                                            ? Color.fromARGB(255, 164, 82, 235).withOpacity(0.3)
                                            : Color(0x40a4afea),
                                        border: Border.all(
                                            color: _selectedGender == 'male'
                                                ? Color.fromARGB(255, 164, 82, 235)
                                                : Color(0x545771F3),
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      width: 124,height: 127,
                                    ),
                                    Positioned(
                                        top: 20,
                                        // left: 35,
                                        child: Icon(
                                          Icons.male,
                                          color: Color.fromARGB(255, 164, 82, 235),
                                          size: 58,
                                        )
                                    ),
                                    Positioned(
                                        bottom: 20,
                                        child: Text('MALE',style: subText1Grey(),textAlign: TextAlign.center,)
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(width: 20,),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedGender = _selectedGender =='female'? null: 'female'; // Toggle or set the value accordingly
                                  });
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: _selectedGender == 'female'
                                            ? Color.fromARGB(255, 164, 82, 235).withOpacity(0.3)
                                            : Color(0x40a4afea),
                                        border: Border.all(
                                            color: _selectedGender == 'female'
                                                ? Color.fromARGB(255, 164, 82, 235)
                                                : Color(0x545771F3),
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      width: 124,height: 127,
                                    ),
                                    Positioned(
                                        top: 20,
                                        // left: 35,
                                        child: Icon(
                                          Icons.female,
                                          color: Color.fromARGB(255, 164, 82, 235),
                                          size: 58,
                                        )
                                    ),
                                    Positioned(
                                        bottom: 20,
                                        child: Text('FEMALE',style: subText1Grey(),textAlign: TextAlign.center,)
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: boxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:5.0),
                          child: Text('Age', style: h2(Colors.white),),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width: 139,height: 51,
                          child: ipTextField(controller: ageController,suffixText: 'Years'),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:5.0),
                          child: Text('Weight', style: h2(Colors.white),),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width: 139,height: 51,
                          child: ipTextField(controller: weightController,suffixText: 'Kg'),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:5.0),
                          child: Text('Height', style: h2(Colors.white),),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width: 139,height: 51,
                          child: ipTextField(controller: heightController,suffixText: 'meters'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(height: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: warning(visible: warningOpt),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  // Center widget to center the button
                  child: SizedBox(
                    width: 160, // Fixed width for the button
                    height: 51,
                    child: ElevatedButton(
                      style: primaryBtn(),
                      child: Text('Submit', style: h2(Colors.white)),
                      onPressed: () {
                        int age = int.tryParse(ageController.text) ?? 0;
                        double weight = double.tryParse(weightController.text) ?? 0.0;
                        double height = double.tryParse(heightController.text) ?? 0.0;

                        isAgePos = age >0;
                        isWeightPos = weight >0;
                        isHeightPos = height >0;

                        if((isAgePos==true)&&(isWeightPos==true)&&(isHeightPos==true)&&(_selectedGender !=null)){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>BmiResult(
                              getAge: age,
                              getWeight: weight,
                              getHeight: height,
                              getGender: _selectedGender,
                            ),
                          ));
                          setState(() {
                            warningOpt=false;
                          });
                        }
                        else{
                          setState(() {
                            warningOpt=true;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,)
            ],
          )
      ),
    );
  }
}