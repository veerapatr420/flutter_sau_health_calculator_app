import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => BmiUiState();
}

class BmiUiState extends State<BmiUi> {
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();

  double bmiResult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                SizedBox(height: 50.0),
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),

                SizedBox(height: 20.0),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("น้ำหนัก (kg)")),
                SizedBox(height: 10.0),
                TextField(
                  controller: weightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'กรอกน้ำหนักของคุณ',
                  ),
                ),

                SizedBox(height: 20.0),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("ส่วนสูง (cm)")),
                SizedBox(height: 10.0),
                TextField(
                  controller: heightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'กรอกส่วนสูงของคุณ',
                  ),
                ),

                SizedBox(height: 30.0),

                ElevatedButton(
                  onPressed: () {
                    double w = double.parse(weightCtrl.text);
                    double h = double.parse(heightCtrl.text) / 100;

                    setState(() {
                      bmiResult = w / (h * h);
                    });
                  },
                  child: Text(
                    'คำนวณ BMI',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(320, 60),
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),

                SizedBox(height: 20.0),

                ElevatedButton(
                  onPressed: () {
                    weightCtrl.clear();
                    heightCtrl.clear();
                    setState(() {
                      bmiResult = 0;
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(320, 60),
                    backgroundColor: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // กล่องแสดงค่า BMI
                Container(
                  width: 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "BMI",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        bmiResult == 0 ? "-" : bmiResult.toStringAsFixed(2),
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
