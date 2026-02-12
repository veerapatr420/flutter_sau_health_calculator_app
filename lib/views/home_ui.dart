import 'package:flutter/material.dart';
import 'package:flutter_sau_health_calculator_app/views/about_ui.dart';
import 'package:flutter_sau_health_calculator_app/views/bmi_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sau_health_calculator_app/views/bmr_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => HomeUiState();
}

class HomeUiState extends State<HomeUi> {

  int barItemIndex = 1;

//สร้างตัวแปร สําหรับเก็บ index ของ BottomNavigationBarItem
List showUI = [
  BmiUi(),
  AboutUi(),
  BmrUi(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (paramValue) {
          setState(() {
            barItemIndex = paramValue ;
          });
        },
        currentIndex: barItemIndex,
        selectedItemColor: Colors.deepOrange,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'BMI'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'About'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.heart,
              ),
              label: 'BMR'),
        ],
      ),
      body: showUI[0],
    );
  }
}
