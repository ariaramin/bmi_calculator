import 'package:bmi_calculator/screens/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputsWidget extends StatelessWidget {
  final Color _primaryColor;
  InputsWidget(this._primaryColor, {super.key});

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

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
              _getInputs(),
              SizedBox(
                height: 22,
              ),
              TextButton(
                onPressed: () {
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

  Widget _getInputs() {
    return Row(
      children: [
        _getTextFormField(
          "قد",
          "سانتی‌متر",
          _heightController,
        ),
        SizedBox(
          width: 14,
        ),
        _getTextFormField(
          "وزن",
          "کیلوگرم",
          _weightController,
        ),
      ],
    );
  }

  Widget _getTextFormField(
    String label,
    String suffix,
    TextEditingController controller,
  ) {
    return Theme(
      data: ThemeData(
        fontFamily: "vazir",
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: _primaryColor,
            ),
      ),
      child: Expanded(
        child: Container(
          height: 48,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              controller: controller,
              cursorColor: _primaryColor,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(),
                suffixText: suffix,
                suffixStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateBMI() {
    final weight = double.parse(_weightController.text);
    final height = double.parse(_heightController.text);

    final heightToMeter = (height / 100);
    var resultBMI = weight / (heightToMeter * heightToMeter);

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
      _resultText = 'کم‌تر از حد نرمال';
      _adviceTitle = "افزایش وزن";
    }
  }
}
