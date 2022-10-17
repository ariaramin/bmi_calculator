import 'package:bmi_calculator/widgets/SlidersWidget.dart';
import 'package:flutter/material.dart';

class WomanTabView extends StatelessWidget {
  const WomanTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 26,
          ),
          child: Image(
            image: AssetImage("images/woman.png"),
          ),
        ),
        SlidersWidget(),
      ],
    );
  }
}
