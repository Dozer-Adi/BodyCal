import 'package:flutter/material.dart';

class bmiCalculator {
  // Method to calculate BMI
  static String calculateBmi({
    required int age, required double weight, required double height, required String gender,
  })
  {
    // Calculate BMI using standard formula (weight / height²)
    double bmi = weight / (height * height);

    // Return BMI rounded to 2 decimal places
    return bmi.toStringAsFixed(2);
  }

  static Map<String, String> getWeightRange(double height)
  {
    double lowerWeight = 18.5*height*height;
    double upperWeight = 25.0*height*height;
    return {
      'lowerWeight':lowerWeight.toStringAsFixed(2),
      'upperWeight':upperWeight.toStringAsFixed(2)
    };
  }

  // static String getLowerWeight(double height)
  // {
  //   double lower = 18.5*height*height;
  //   return lower.toStringAsFixed(2);
  // }
  // static String getUpperWeight(double height)
  // {
  //   double upper = 25.0*height*height;
  //   return upper.toStringAsFixed(2);
  // }

  // Optional: Method to get BMI category
  static String getBmiCategory(double? bmi) {
    if (bmi! < 16) return 'Severe Thinness';
    if (bmi >= 16 && bmi < 17) return 'Moderate Thinness';
    if (bmi >= 17 && bmi < 18.5) return 'Mild Thinness';
    if (bmi >= 18.5 && bmi < 25) return 'Normal';
    if (bmi >= 25 && bmi < 30) return 'Overweight';
    if (bmi >= 30 && bmi < 35) return 'Obese Class I';
    if (bmi >= 35 && bmi < 40) return 'Obese Class II';
    return 'Obese Class III';
  }
  static Color getBmiColor(String getBmiCategory) {
    if (getBmiCategory == 'Normal') return Color(0xff31e170);
    if (getBmiCategory == 'Mild Thinness' || getBmiCategory == 'Obese Class I') return Color(0xfff9c727);
    if (getBmiCategory == 'Moderate Thinness' || getBmiCategory == 'Obese Class II') return Color(0xfffc9e3a);
    if (getBmiCategory == 'Severe Thinness' || getBmiCategory == 'Obese Class III') return Color(0xfffb4b5b);
    return Color(0xfffcdf54);
  }

}
class waterCalculator{
  static Map<String, String> calculateWater({
    required double weight, required String? activity, required  String? climate
  })
  {
    double? lowerWaterMultiplier;
    double? upperWaterMultiplier;
    double? waterAdder;

    if(activity=='Sedentary'){lowerWaterMultiplier=0.03 ; upperWaterMultiplier=0.035; }
    else if(activity=='Moderate'){lowerWaterMultiplier=0.035; upperWaterMultiplier=0.04;}
    else if (activity=='Active'){lowerWaterMultiplier=0.4; upperWaterMultiplier=0.5;}
    else{lowerWaterMultiplier=0.5; upperWaterMultiplier=0.6;}

    if(climate=='Normal') waterAdder=0.0;
    else if(climate=='Hot/Humid/Dry') waterAdder=0.8;
    else waterAdder=0.4;

    double lowerWater = weight*lowerWaterMultiplier+waterAdder;
    double upperWater = weight*upperWaterMultiplier+waterAdder;

    return {
      'lowerWater': lowerWater.toStringAsFixed(2),
      'upperWater': upperWater.toStringAsFixed(2),
    };
  }
}

class proteinCalculator{
  static Map<String, String> calculateProtein({
    required double weight, required String? activity
  })
  {
    double? lowerProteinMultiplier;
    double? upperProteinMultiplier;

    if(activity=='Sedentary'){lowerProteinMultiplier=0.8; upperProteinMultiplier=1.0;}
    else if(activity=='Moderate'){lowerProteinMultiplier=1.2; upperProteinMultiplier=1.6;}
    else if(activity=='Active'){lowerProteinMultiplier=1.6; upperProteinMultiplier=2.0;}
    else{lowerProteinMultiplier=2.0;upperProteinMultiplier=2.5;}

    double lowerProtein = weight*lowerProteinMultiplier;
    double upperProtein = weight*upperProteinMultiplier;

    double lowerAdaProtein = 0.8*weight;
    double upperAdaProtein = 1.0*weight;

    double whoProtein = 0.83*weight;

    return{
      'lowerProtein': lowerProtein.toStringAsFixed(2),
      'upperProtein': upperProtein.toStringAsFixed(2),
      'lowerAdaProtein': lowerAdaProtein.toStringAsFixed(2),
      'upperAdaProtein': upperAdaProtein.toStringAsFixed(2),
      'whoProtein': whoProtein.toStringAsFixed(2),
    };
  }
}
