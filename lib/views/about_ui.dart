import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => AboutUiState();
}

class AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Body Health Calculator',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            Text(
              'คำนวณหาค่าดัชนีมวลการ BMI',
              style: TextStyle(
                fontSize: 15.0,),
            ),
            Text(
              'คำนวณค่าแคลอรี่ที่ร่างกายต้องการ BMR',
              style: TextStyle(
                fontSize: 15.0,),
            )
          ],
        ),
        ),
    );
  }
}