import 'package:bmi_calculator/widgets/LeftShape.dart';
import 'package:bmi_calculator/widgets/RightShape.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';

class ResultScreen extends StatelessWidget {
  final double _resultBMI;
  final _resultText, _adviceTitle;
  ResultScreen(this._resultBMI, this._resultText, this._adviceTitle,
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
      backgroundColor: accentColor,
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
              RightShape(230),
              SizedBox(
                height: 16,
              ),
              LeftShape(120),
            ],
          ),
          _getResume(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
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

  // double _calculateShapeWidthSize(double width) {
  //   var defaultWidth = (width * 10) - 180;
  //   if (defaultWidth < double.infinity) {
  //     return defaultWidth;
  //   } else if (defaultWidth < 0) {
  //     return defaultWidth + 80;
  //   } else {
  //     return double.infinity - 180;
  //   }
  // }

  Widget _getResultCard() {
    return Container(
      width: 236,
      height: 226,
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
                    fontSize: 68,
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
      return Colors.red[700];
    } else {
      return Colors.yellow[700];
    }
  }

  Widget _getResume() {
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
          _getHistory(),
        ],
      ),
    );
  }

  Widget _getHistory() {
    var resumeList = [
      "💻 از سال ۹۹ به طور جدی برنامه نویسی رو از حوزه وب شروع کردم",
      "📱 از سال ۱۴۰۰ به حوزه اندروید و موبایل علاقه‌مند شدم",
      "👨‍💻 یکسال در حوزه اندروید فعالیت کردم و بعد از اون به فلاتر علاقه‌مند شدم",
      "📚 درحال حاضر هم مشغول یادگیری فلاتر هستم",
      "🔥 این داستان ادامه دارد..."
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          for (var resume in resumeList)
            Text(
              "$resume",
              textDirection: TextDirection.rtl,
            ),
        ],
      ),
    );
  }
}
