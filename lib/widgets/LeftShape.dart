import 'package:flutter/material.dart';

class LeftShape extends StatelessWidget {
  final double _width;
  LeftShape(this._width, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: _width,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "شاخص مثبت",
              style: TextStyle(
                fontSize: 16,
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
