import 'package:body_cal/pages/waterResult.dart';
import 'package:flutter/material.dart';

import '../ui_helper/util.dart';


class WaterCal extends StatefulWidget{
  const WaterCal({super.key});

  @override
  State<WaterCal> createState()=> _WaterCalState();
}

class _WaterCalState extends State<WaterCal>{

  String? activityLevel;
  String? climaticCondition;
  var weightController = TextEditingController();
  bool isWeightPos=false;
  bool warningOpt = false;

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
                  Text('HydroCal', style: h1(),)
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
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Container(
                decoration: boxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:5.0),
                        child: Text('Weight', style: h2(Colors.white),),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: 139,height: 51,
                        child: ipTextField(controller: weightController,suffixText: 'Kg'),
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
                                if (states.contains(MaterialState.selected)) {
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
                    double weight = double.tryParse(weightController.text) ?? 0.0;
                    isWeightPos = weight >0;

                    if((isWeightPos==true)&&(activityLevel!=null)&&(climaticCondition!=null)){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>waterResult(
                          getWeight: weight,
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