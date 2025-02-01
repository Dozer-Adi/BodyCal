// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:body_cal/ui_helper/util.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: radialBackground(),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('Welcome to BodyCal',style: mainHeading(), textAlign: TextAlign.center),
              ),
              SizedBox(height: 15),
              Text('Health is Wealth!',style: subText1Grey(),textAlign: TextAlign.center,),
              SizedBox(height: 70,),
              SizedBox(width: 378,height: 27,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Text('Health Tools:',style: h2(Colors.white),textAlign: TextAlign.left,),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: InkWell(
                  child: Container(
                    // padding: EdgeInsets.all(20.0),
                    width:378,
                    decoration: boxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('MegaCal',style: h2(Colors.white),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(child: Text('Calculate BMI, Protein, and Water Intake',style: subText1Grey(),softWrap: true,)),
                              SizedBox(width: 20,),
                              SvgPicture.asset('assets/svg/calculator1.svg', width: 53,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, '/megaCal');
                  },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: InkWell(
                  child: Container(
                    // padding: EdgeInsets.all(20.0),
                    width:378,
                    decoration: boxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('BMICal',style: h2(Colors.white),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(child: Text('Calculate Your Body Mass Index',style: subText1Grey(),softWrap: true,)),
                              SizedBox(width: 20,),
                              SvgPicture.asset('assets/svg/weight-scale1.svg',width:63,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context,'/bmiCal');
                  },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: InkWell(
                  child: Container(
                    // padding: EdgeInsets.all(20.0),
                    width:378,
                    decoration: boxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ProtiCal',style: h2(Colors.white),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Calculate Protein Intake',style: subText1Grey(),),
                              SvgPicture.asset('assets/svg/protein1.svg',width:53,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, '/proteinCal');
                  },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: InkWell(
                  child: Container(
                    // padding: EdgeInsets.all(20.0),
                    width:378,
                    decoration: boxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('HydroCal',style: h2(Colors.white),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(child: Text('Calculate Your Daily Water Needs',style: subText1Grey(),softWrap: true,)),
                              SizedBox(width: 20,),
                              SvgPicture.asset('assets/svg/water-drop1.svg',width:53,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, '/waterCal');
                  },
                ),
              ),
              SizedBox(height: 50,),
            ],
          )
      ),
    );
  }
}
