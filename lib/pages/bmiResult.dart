import 'package:flutter/material.dart';
import 'package:body_cal/ui_helper/util.dart';
import 'package:body_cal/ui_helper/logic.dart';

class BmiResult extends StatefulWidget{

  final int getAge;
  final double getWeight;
  final double getHeight;
  final String? getGender;

  const BmiResult({
    Key? key,
    required this.getAge,
    required this.getWeight,
    required this.getHeight,
    required this.getGender
  }) : super(key: key);

  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult>{
  late String bmiResult;
  late String bmiCategory;
  late Map weightRange;
  // var bmiColor = 0xfffcdf54;

  @override
  void initState() {
    super.initState();
    bmiResult = bmiCalculator.calculateBmi(
        age: widget.getAge,
        weight: widget.getWeight,
        height: widget.getHeight,
        gender: widget.getGender ?? ''
    );

    weightRange = bmiCalculator.getWeightRange(widget.getHeight);

    var bmiResultDouble = double.tryParse(bmiResult);
    bmiCategory = bmiCalculator.getBmiCategory(bmiResultDouble);
  }

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
                    Text('BMI Calculator', style: h1(),)
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: bmiCalculator.getBmiColor(bmiCategory).withAlpha(24),
                      border: Border.all(color: bmiCalculator.getBmiColor(bmiCategory)),
                      borderRadius: BorderRadius.circular(24)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Your BMI Score', style: h3(),),
                                SizedBox(height: 5,),
                                Text('$bmiResult', style: h2(Colors.white),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Weight Status', style: h3(),),
                                SizedBox(height: 5,),
                                Text('$bmiCategory',
                                    style: TextStyle(color: bmiCalculator.getBmiColor(bmiCategory),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400
                                    )),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(width: double.infinity,height: 2,color: Colors.grey,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('${widget.getGender}', style: subText2(Colors.grey),),
                              // SizedBox(width: 10,),
                              Container(width: 2, height: 27,color: Colors.grey,),
                              // SizedBox(width: 10,),
                              Text('${widget.getAge} yrs', style: subText2(Colors.grey),),
                              Container(width: 2, height: 27,color: Colors.grey,),
                              Text('${widget.getWeight} Kg', style: subText2(Colors.grey),),
                              Container(width: 2, height: 27,color: Colors.grey,),
                              Text('${widget.getHeight} m',style: subText2(Colors.grey),)
                            ],
                          ),
                        ),
                        Container(width: double.infinity,height: 2,color: Colors.grey,),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Healthy BMI', style: subText2(Colors.white),),
                                Text('Range',style: h3(),),
                                SizedBox(height: 5,),
                                Text('18.5 - 25',style: h2(Colors.grey)),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Healthy Weight', style: subText2(Colors.white),),
                                Text('Range',style: h3(),),
                                SizedBox(height: 5,),
                                Text('${weightRange['lowerWeight']} - ${weightRange['upperWeight']}',style: h2(Colors.grey),),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: boxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Category', style: subText1White(),),
                            SizedBox(height: 15,),
                            Text('Severe Thinness', style: subText2(Color(0xfffb4b5b)),),
                            SizedBox(height: 5,),
                            Text('Moderate Thinness', style: subText2(Color(0xfffc9e3a)),),
                            SizedBox(height: 5,),
                            Text('Mild Thinness', style: subText2(Color(0xfff9c727)),),
                            SizedBox(height: 5,),
                            Text('Normal', style: subText2(Color(0xff31e170)),),
                            SizedBox(height: 5,),
                            Text('Overweight', style: subText2(Color(0xfffcdf54)),),
                            SizedBox(height: 5,),
                            Text('Obese Class I', style: subText2(Color(0xfff9c727)),),
                            SizedBox(height: 5,),
                            Text('Obese Class II', style: subText2(Color(0xfffc9e3a)),),
                            SizedBox(height: 5,),
                            Text('Obese Class III', style: subText2(Color(0xfffb4b5b)),),
                          ],
                        ),
                        Column(
                          children: [
                            Text('BMI range - kg/m2', style: subText1White(),),
                            SizedBox(height: 15,),
                            Text('<16', style: subText2(Color(0xfffb4b5b)),),
                            SizedBox(height: 5,),
                            Text('16-17', style: subText2(Color(0xfffc9e3a)),),
                            SizedBox(height: 5,),
                            Text('17-18.5', style: subText2(Color(0xfff9c727)),),
                            SizedBox(height: 5,),
                            Text('18.5-25', style: subText2(Color(0xff31e170)),),
                            SizedBox(height: 5,),
                            Text('25-30', style: subText2(Color(0xfffcdf54)),),
                            SizedBox(height: 5,),
                            Text('30-35', style: subText2(Color(0xfff9c727)),),
                            SizedBox(height: 5,),
                            Text('35-40', style: subText2(Color(0xfffc9e3a)),),
                            SizedBox(height: 5,),
                            Text('>40', style: subText2(Color(0xfffb4b5b)),),
                          ],
                        )
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
          )
      ),
    );
  }
}