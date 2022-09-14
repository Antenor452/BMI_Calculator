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
  @override
  Widget build(BuildContext context) {
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
          children: [],
        ),
      ),
    );
  }
}
