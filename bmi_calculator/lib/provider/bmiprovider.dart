import 'package:bmi_calculator/model/bmi.dart';
import 'package:flutter/material.dart';

class Bmiprovider extends ChangeNotifier
{
   Bmi bmi=Bmi(); 

   double bmiout;
   String bmistate;
 
  calculate(double dweight,double dheight) async
  {
    bmiout =((dweight/(dheight*dheight)*10000));
     bmi.bmicalculator=bmiout.toString();

     if(bmiout<18.5)
    {
      bmi.bmistate='LowerWeight';
    }
    else if(bmiout>18.5 && bmiout<=24.9)
    {
      bmi.bmistate='Normal';
    }
    else if(bmiout>=25 && bmiout<=29.9)
    {
      bmi.bmistate='Overweight';
    }
    else if(bmiout>=30 && bmiout<=34.9)
    {
      bmi.bmistate='Obesity';
    }
    else
    {
      bmi.bmistate='ExtremeWeight';
    }
    notifyListeners();
  }
  
}