import 'package:flutter/material.dart';

import '../ui_helper/logic.dart';
import '../ui_helper/util.dart';


class waterResult extends StatefulWidget{
  const waterResult({
    required this.getWeight,
    required this.getActivityLevel,
    required this.getClimaticCondition
  });

  final double getWeight;
  final String? getActivityLevel;
  final String? getClimaticCondition;

  @override
  State<waterResult> createState() => _waterResultState();
}

class _waterResultState extends State<waterResult>{

  late Map waterNeeds;

  @override
  void initState() {
    super.initState();
    waterNeeds = waterCalculator.calculateWater(
        weight: widget.getWeight,
        activity: widget.getActivityLevel,
        climate: widget.getClimaticCondition
    );
  }

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
                  Text('HydroCalc', style: h1(),)
                ],
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: boxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: h2(Colors.white),
                            children: [
                              TextSpan(text: 'The Recommended '),
                              TextSpan(text: 'Water ', style: h2(Color.fromARGB(255, 164, 82, 235))),
                            ]
                        ),
                      ),
                      Text('Intake Level', style: h2(Colors.white),),
                      SizedBox(height: 10,),
                      Text('${waterNeeds['lowerWater']} - ${waterNeeds['upperWater']} Liters/day', style: subText1Green(),),
                      SizedBox(height: 10,),
                      Text('For your:',style: subText2(Colors.grey),),
                      // SizedBox(height: 5,),
                      Text('${widget.getWeight} Kg & ${widget.getClimaticCondition} climate', style: subText2(Colors.grey),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Center(
                child: SizedBox(width: 160, height: 51,
                  child: ElevatedButton(
                    style: primaryBtn(),
                    child: Text('Home',style: h2(Colors.white)),
                    onPressed: (){
                      Navigator.pushNamed(context, '/dashboard');
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}