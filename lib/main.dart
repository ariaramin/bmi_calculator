import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/screens/HomeScreen.dart';
import 'package:bmi_calculator/tabViews/MaleTabView.dart';
import 'package:bmi_calculator/tabViews/WomanTabView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "vazir",
      ),
      home: HomeScreen(),
    );
  }
}
