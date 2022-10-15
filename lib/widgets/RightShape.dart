import 'package:flutter/material.dart';

class RightShape extends StatelessWidget {
  final double _width;
  RightShape(this._width, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "شاخص منفی",
              style: TextStyle(
                fontSize: 16,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              width: _width,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
