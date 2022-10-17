import 'package:bmi_calculator/widgets/LeftShape.dart';
import 'package:bmi_calculator/widgets/RightShape.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';

class ResultScreen extends StatelessWidget {
  final double _resultBMI;
  final _resultText, _adviceTitle, _adviceList;
  ResultScreen(
      this._resultBMI, this._resultText, this._adviceTitle, this._adviceList,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _getAppBar(),
      body: SafeArea(
        child: _getBody(context),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      title: Text("نتیجه"),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _getResultCard(),
          Column(
            children: [
              RightShape(
                _getRightShapeWidthSize(
                  context,
                  _resultBMI,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              LeftShape(
                _getLeftShapeWidthSize(
                  context,
                  _resultBMI,
                ),
              ),
            ],
          ),
          _getAdvice(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "محاسبه مجدد",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  FaIcon(
                    FontAwesomeIcons.repeat,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getRightShapeWidthSize(BuildContext context, double bmi) {
    if (bmi < 18.5) {
      return _getPositiveIndex(context, bmi);
    } else {
      return _getNegativeIndex(context, bmi);
    }
  }

  double _getLeftShapeWidthSize(BuildContext context, double bmi) {
    if (bmi < 18.5) {
      return _getNegativeIndex(context, bmi);
    } else {
      return _getPositiveIndex(context, bmi);
    }
  }

  double _getNegativeIndex(BuildContext context, double width) {
    var defaultWidth = (width * 10).round();
    var widthOfScreen = MediaQuery.of(context).size.width;

    if (defaultWidth + 30 > widthOfScreen.round()) {
      return widthOfScreen - 108;
    } else if (defaultWidth - 80 < 0) {
      return defaultWidth.toDouble();
    } else {
      return defaultWidth - 80;
    }
  }

  double _getPositiveIndex(BuildContext context, double width) {
    var rightShapeWidth = _getNegativeIndex(context, width);
    var widthOfScreen = MediaQuery.of(context).size.width;
    var leftShapeWidth = widthOfScreen - rightShapeWidth;

    if (leftShapeWidth + 120 > widthOfScreen.round()) {
      return widthOfScreen - 108;
    } else {
      return leftShapeWidth;
    }
  }

  Widget _getResultCard() {
    return Container(
      width: 236,
      height: 216,
      child: Card(
        elevation: 12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "نتیجه شاخص توده بدنی",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  _resultBMI.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _resultText,
                      style: TextStyle(
                        fontSize: 16,
                        color: _setStatusColor(),
                      ),
                    ),
                    Text(
                      " : وضعیت شما",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color? _setStatusColor() {
    if (_resultText == "نرمال") {
      return Colors.green[700];
    } else if (_resultText == "اضافه وزن") {
      return Colors.yellow[700];
    } else if (_resultText == "چاقی") {
      return Colors.orange[700];
    } else if (_resultText == "چاقی مفرت") {
      return Colors.red[700];
    } else {
      return Colors.blue[700];
    }
  }

  Widget _getAdvice() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        children: [
          Text(
            "چند راهکار برای $_adviceTitle",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          _getAdviceList(),
        ],
      ),
    );
  }

  Widget _getAdviceList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          for (var advice in _adviceList)
            Text(
              "$advice",
              textDirection: TextDirection.rtl,
            ),
        ],
      ),
    );
  }
}
