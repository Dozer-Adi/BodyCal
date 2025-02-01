// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:body_cal/ui_helper/util.dart';
import 'package:body_cal/pages/megaCalResult.dart';

class megaCal extends StatefulWidget{
  const megaCal({super.key});

  @override
  State<megaCal> createState()=> _megaCalState();
}

class _megaCalState extends State<megaCal>{

  var ageController = TextEditingController();
  var weightController = TextEditingController();
  var genderController = TextEditingController();
  var heightController = TextEditingController();

  bool warningOpt = false;

  String? activityLevel;
  String? climaticCondition;

  String? _selectedGender;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: radialBackground()
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
                  Text('MegaCal', style: h1(),)
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: boxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender', style: h2(Colors.white),),
                      SizedBox(height: 10,),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGender = _selectedGender =='female'? null: 'female';
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
                      )
                    ],
                  ),
                ),
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
            Padding( padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: boxDecoration(),
                child: Padding( padding: EdgeInsets.all(20),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:5.0),
                          child: Text('Activity Level', style: h2(Colors.white),),
                        ),
                        SizedBox(height:5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return Color.fromARGB(255, 164, 82, 235); // Selected state color
                                }
                                return Colors.grey; // Unselected state color
                              }),
                              value: 'Sedentary',
                              groupValue: activityLevel,
                              onChanged: (String? value){
                                setState(() {
                                  activityLevel=value;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            Flexible(child: Text('Sedentary: Little or no exercise', style: subText1Grey(),softWrap: true,)),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Color.fromARGB(255, 164, 82, 235); // Selected state color
                                }
                                return Colors.grey; // Unselected state color
                              }),
                              value: 'Moderate',
                              groupValue: activityLevel,
                              onChanged: (String? value){
                                setState(() {
                                  activityLevel=value;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            Flexible(child: Text('Moderate: exercise 3-4 times/week', style: subText1Grey(),softWrap: true,)),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Color.fromARGB(255, 164, 82, 235); // Selected state color
                                }
                                return Colors.grey; // Unselected state color
                              }),
                              value: 'Active',
                              groupValue: activityLevel,
                              onChanged: (String? value){
                                setState(() {
                                  activityLevel=value;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            Flexible(child: Text('Active: daily exercise', style: subText1Grey(),softWrap: true,)),
                          ],
                        ),
                        SizedBox(height:5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Color.fromARGB(255, 164, 82, 235); // Selected state color
                                  }
                                  return Colors.grey; // Unselected state color
                                }),
                                value: 'Very active',
                                groupValue: activityLevel,
                                onChanged: (String? value){
                                  setState(() {
                                    activityLevel=value;
                                  });
                                }
                            ),
                            SizedBox(width: 10,),
                            Flexible(child: Text('Very active: Intense exercise or heavy training', style: subText1Grey(),softWrap: true,)),
                          ],
                        ),
                      ],
                    )
                ),
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
                        child: Text('Climatic Condition', style: h2(Colors.white),),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Color.fromARGB(255, 164, 82, 235); // Selected state color
                              }
                              return Colors.grey; // Unselected state color
                            }),
                            value: 'Normal',
                            groupValue: climaticCondition,
                            onChanged: (String? value){
                              setState(() {
                                climaticCondition=value;
                              });
                            },
                          ),
                          SizedBox(width: 10,),
                          Flexible(child: Text('Normal Climate', style: subText1Grey(),softWrap: true,)),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Color.fromARGB(255, 164, 82, 235); // Selected state color
                              }
                              return Colors.grey; // Unselected state color
                            }),
                            value: 'Hot/Humid/Dry',
                            groupValue: climaticCondition,
                            onChanged: (String? value){
                              setState(() {
                                climaticCondition=value;
                              });
                            },
                          ),
                          SizedBox(width: 10,),
                          Flexible(child: Text('Hot/Humid/Dry Climate', style: subText1Grey(),softWrap: true,)),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Color.fromARGB(255, 164, 82, 235); // Selected state color
                              }
                              return Colors.grey; // Unselected state color
                            }),
                            value: 'Cold',
                            groupValue: climaticCondition,
                            onChanged: (String? value){
                              setState(() {
                                climaticCondition=value;
                              });
                            },
                          ),
                          SizedBox(width: 10,),
                          Flexible(child: Text('Cold Climate', style: subText1Grey(),softWrap: true,)),
                        ],
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
            Center(
              child: SizedBox(
                width: 160, height: 51,
                child: ElevatedButton(
                  style: primaryBtn(),
                  child: Text('Submit', style: h2(Colors.white)),
                  onPressed: (){
                    int age = int.tryParse(ageController.text) ?? 0;
                    double weight = double.tryParse(weightController.text) ?? 0.0;
                    double height = double.tryParse(heightController.text) ?? 0.0;

                    if((weight>0)&&(age>0)&&(height>0)&&(activityLevel!=null)&&(climaticCondition!=null)){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>megaCalResult(
                          getAge: age,
                          getWeight: weight,
                          getHeight: height,
                          getGender: _selectedGender,
                          getActivityLevel: activityLevel,
                          getClimaticCondition: climaticCondition,
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
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}