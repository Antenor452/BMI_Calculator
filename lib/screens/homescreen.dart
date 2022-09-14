import 'package:flutter/material.dart';
import "package:bmi_calc/widgets/left_bar.dart";
import "package:bmi_calc/widgets/right_bar.dart";
import "package:bmi_calc/constants/app_constants.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double? _bmiResults = 0;
  String? _textResults = "";
  bool _showResults = false;

  @override
  Widget build(BuildContext context) {
    Widget dialogOnError = AlertDialog(
      title: const Center(child: Text('Error')),
      content: const Text("Please enter a value for height and weight"),
      backgroundColor: mainHexColor,
      titleTextStyle: TextStyle(color: accentHexColor),
      contentTextStyle: TextStyle(color: accentHexColor),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Ok",
              style: TextStyle(color: accentHexColor),
            ))
      ],
    );

    void calculateBMI() {
      if (_heightController.text.isEmpty || _weightController.text.isEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return dialogOnError;
            });
      } else {
        double h = double.parse(_heightController.text);
        double w = double.parse(_weightController.text);
        setState(() {
          _bmiResults = w / (h * h);
          if (_bmiResults! > 25) {
            _textResults = "You\'re  over weight";
          } else if (_bmiResults! >= 18.5 && _bmiResults! <= 25) {
            _textResults = "You\'re normal";
          } else {
            _textResults = "You\'re under weight";
          }
          _showResults = true;
        });
      }
    }

    ;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height in M",
                      hintStyle: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(
                          .8,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight in KG",
                      hintStyle: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(
                          .8,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: calculateBMI,
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(color: accentHexColor, fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: _showResults,
              child: Center(
                child: Text(
                  _bmiResults!.toStringAsFixed(2),
                  style: TextStyle(
                      color: accentHexColor,
                      fontSize: 60,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: _showResults,
              child: Center(
                child: Text(
                  _textResults!.toString(),
                  style: TextStyle(color: accentHexColor, fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 40),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 70),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 20),
            const SizedBox(
              height: 20,
            ),
            const RightBar(barWidth: 40),
            const SizedBox(
              height: 20,
            ),
            const RightBar(barWidth: 40)
          ],
        ),
      ),
    );
  }
}
