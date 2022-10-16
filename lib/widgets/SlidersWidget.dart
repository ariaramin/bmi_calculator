import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/ResultScreen.dart';

class SlidersWidget extends StatefulWidget {
  final Color _primaryColor;
  const SlidersWidget(this._primaryColor, {super.key});

  @override
  State<SlidersWidget> createState() => _SlidersWidgetState(_primaryColor);
}

class _SlidersWidgetState extends State<SlidersWidget> {
  final Color _primaryColor;
  _SlidersWidgetState(this._primaryColor);

  double _weightValue = 0;
  double _heightValue = 0;

  var _resultText = "";
  var _adviceTitle = "";
  var _adviceList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              _getSliders(),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  if (_weightValue > 0 && _heightValue > 0) {
                    var resultBMI = _calculateBMI();
                    _setAdvices(resultBMI);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return ResultScreen(
                          resultBMI,
                          _resultText,
                          _adviceTitle,
                        );
                      }),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: _primaryColor,
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
                      "محاسبه",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    FaIcon(
                      FontAwesomeIcons.calculator,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSliders() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${_weightValue.round()} کیلوگرم",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                " :وزن",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 24,
            child: Slider(
              value: _weightValue,
              min: 0,
              max: 180,
              divisions: 36,
              onChanged: (value) {
                setState(() {
                  _weightValue = value;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${_heightValue.round()} سانتی‌متر",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                " :قد",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 24,
            child: Slider(
              value: _heightValue,
              min: 0,
              max: 220,
              divisions: 44,
              onChanged: (value) {
                setState(() {
                  _heightValue = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  double _calculateBMI() {
    var heightToMeter = (_heightValue / 100);
    if (heightToMeter <= 0.1) {
      heightToMeter *= 10;
    }
    var resultBMI = _weightValue / (heightToMeter * heightToMeter);

    return resultBMI;
  }

  void _setAdvices(double bmi) {
    if (bmi > 25) {
      _resultText = 'اضافه وزن';
      _adviceTitle = "کاهش وزن";
    } else if (bmi >= 18.5 && bmi <= 25) {
      _resultText = 'نرمال';
      _adviceTitle = "حفظ سلامت";
    } else {
      _resultText = 'کمبود وزن';
      _adviceTitle = "افزایش وزن";
    }
  }
}
