import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/ResultScreen.dart';

class SlidersWidget extends StatefulWidget {
  const SlidersWidget({super.key});

  @override
  State<SlidersWidget> createState() => _SlidersWidgetState();
}

class _SlidersWidgetState extends State<SlidersWidget> {
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
                          _adviceList,
                        );
                      }),
                    );
                  }
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
    var resultBMI = _weightValue / (heightToMeter * heightToMeter);
    if (resultBMI > 100) {
      resultBMI /= 10;
    }

    return resultBMI;
  }

  void _setAdvices(double bmi) {
    if (bmi >= 25 && bmi < 30) {
      _resultText = 'اضافه وزن';
      _adviceTitle = "کاهش وزن";
      _adviceList = [
        "💪 به فعالیت بدنی و ورزش منظم بپردازید",
        "🐟 غذاهای متنوع و غنی از مواد مغذی بخورید",
        "🍏 میوه و سبزی فراوان بخورید",
        "🍳 پروتئین بیشتری مصرف کنید",
        "💧 آب زیاد بنوشید"
      ];
    } else if (bmi >= 18.5 && bmi <= 25) {
      _resultText = 'نرمال';
      _adviceTitle = "حفظ سلامت";
      _adviceList = [
        "💪 به فعالیت بدنی و ورزش منظم بپردازید",
        "🐟 غذاهای غنی از مواد مغذی را انتخاب کنید",
        "🍏 میوه و سبزی فراوان بخورید",
        "💧 آب زیاد بنوشید",
      ];
    } else if (bmi >= 30 && bmi <= 40) {
      _resultText = 'چاقی';
      _adviceTitle = "کاهش وزن";
      _adviceList = [
        "💪 به فعالیت بدنی و ورزش منظم بپردازید",
        "🐟 غذاهای متنوع و غنی از مواد مغذی بخورید",
        "🍏 میوه و سبزی فراوان بخورید",
        "🍳 پروتئین بیشتری مصرف کنید",
        "💧 آب زیاد بنوشید"
      ];
    } else if (bmi > 40) {
      _resultText = 'چاقی مفرت';
      _adviceTitle = "کاهش وزن";
      _adviceList = [
        "💪 به فعالیت بدنی و ورزش منظم بپردازید",
        "🐟 غذاهای متنوع و غنی از مواد مغذی بخورید",
        "🍏 میوه و سبزی فراوان بخورید",
        "🍳 پروتئین بیشتری مصرف کنید",
        "💧 آب زیاد بنوشید"
      ];
    } else {
      _resultText = 'کمبود وزن';
      _adviceTitle = "افزایش وزن";
      _adviceList = [
        "🍗 بیشتر غذا بخورید",
        "🐟 غذاهای غنی از مواد مغذی را انتخاب کنید",
        "💪 به فعالیت بدنی و ورزش منظم بپردازید",
        "🍏 میوه و سبزی فراوان بخورید",
        "🍳 پروتئین بیشتری مصرف کنید",
      ];
    }
  }
}
