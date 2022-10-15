import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/InputsWidget.dart';

class ManTabView extends StatelessWidget {
  const ManTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 26,
          ),
          child: Image(
            image: AssetImage("images/man.png"),
          ),
        ),
        InputsWidget(primaryColor),
      ],
    );
  }
}
