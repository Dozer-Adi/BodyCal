import 'package:flutter/material.dart';

import '../ui_helper/logic.dart';
import '../ui_helper/util.dart';


class proteinResult extends StatefulWidget{
  const proteinResult({
    required this.getWeight,
    required this.getActivityLevel,
  });

  final double getWeight;
  final String? getActivityLevel;

  @override
  State<proteinResult> createState()=>_proteinResultState();
}

class _proteinResultState extends State<proteinResult>{
  late Map proteinNeeds;

  @override
  void initState() {
    super.initState();
    proteinNeeds = proteinCalculator.calculateProtein(
      weight: widget.getWeight,
      activity: widget.getActivityLevel,
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
                  Text('ProtiCal', style: h1(),)
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
                              TextSpan(text:'The Recommended '),
                              TextSpan(text:'Protein', style: h2(Color(0xfff9c727))),
                            ]
                        ),
                      ),
                      Text('Intake Level', style: h2(Colors.white),),
                      SizedBox(height: 10,),
                      Text('${proteinNeeds['lowerProtein']} - ${proteinNeeds['upperProtein']} grams/day', style: subText1Green(),),
                      SizedBox(height: 10,),
                      Text('For your:',style: subText2(Colors.grey),),
                      // SizedBox(height: 5,),
                      Text('${widget.getWeight} Kg & ${widget.getActivityLevel} activity level', style: subText2(Colors.grey),),
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
                      RichText(
                          text: TextSpan(style: subText1White(),
                              children: [
                                TextSpan(text: 'The basic protein intake '),
                                TextSpan(text:'guidelines ', style: subText1Purple()),
                                TextSpan(text:'from various authorities: '),
                              ]
                          )
                      ),
                      SizedBox(height: 10,),
                      Text('American Dietetic Association (ADA):', style: subText2(Colors.white),),
                      // SizedBox(height: 5,),
                      Text('at least ${proteinNeeds['lowerAdaProtein']} - ${proteinNeeds['upperAdaProtein']} grams/day',style: subText2(Color(0xff31e170)),),
                      SizedBox(height: 10,),
                      Text('World Health Organization safe lower limit:',style: subText2(Colors.white),),
                      // SizedBox(height: 5,),
                      Text('${proteinNeeds['whoProtein']} grams/day',style: subText2(Color(0xff31e170)),),
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
