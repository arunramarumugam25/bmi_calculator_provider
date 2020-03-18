import 'package:bmi_calculator/provider/bmiprovider.dart';
import 'package:bmi_calculator/views/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MaterialApp(
    home:ChangeNotifierProvider(
        create: (context) => Bmiprovider(),
        child: Bmi_calculator())

  )
);

