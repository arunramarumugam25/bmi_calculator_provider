import 'package:bmi_calculator/provider/bmiprovider.dart';
import 'package:bmi_calculator/utils/colors.dart';
import 'package:bmi_calculator/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bmi_calculator extends StatefulWidget {
  @override
  _Bmi_calculatorState createState() => _Bmi_calculatorState();
}

class _Bmi_calculatorState extends State<Bmi_calculator> {

  final kformkey=GlobalKey<FormState>();
  
  final weight =TextEditingController();
  final height =TextEditingController();
  String  bmival='0.0';
  String  bmistatement;
  
  
  @override
  Widget build(BuildContext context) {

    final vm=Provider.of<Bmiprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title:Text('BMI calculator',style: Bmitextstyle.bmititle,),
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Column(
        children:<Widget>
        [
          Form(key: kformkey,
          child:Column(
           mainAxisAlignment:MainAxisAlignment.center,
            children:<Widget>
            [
              Padding(
                padding: EdgeInsets.only(left:30,right:30,bottom:20),
              child: TextFormField(
                controller: weight,
                decoration: InputDecoration(hintText:'Enter your weight',hintStyle: Bmitextstyle.bmiformfield),
              ),),

              Padding(
                padding: EdgeInsets.only(left:30,right:30,bottom:20),
              child: TextFormField(
                controller: height,
                decoration: InputDecoration(hintText:'Enter your height',hintStyle: Bmitextstyle.bmiformfield),
              ),),

              Padding(
                padding: EdgeInsets.only(left:30,right:30,bottom:20),
              child: FlatButton(onPressed: (){
                setState(() {
                  vm.calculate(double.parse(weight.text), double.parse(height.text));
                  bmival=vm.bmi.bmicalculator;
                  bmistatement=vm.bmi.bmistate;

                });

              },color: AppColor.backgroundColor, child: Text('Calculate',style:Bmitextstyle.bmibutton))
              ),

              
            ]
          )),

           Padding(
                 padding: EdgeInsets.only(left:30,right:30,bottom:20),
                 child:
                 Text('Your BMI is $bmival')
                
               ),
                Padding(
                 padding: EdgeInsets.only(left:30,right:30,bottom:20),
                 child:
                 Text('$bmistatement')
                
               )
      
        ]
      )
    );
  }
}