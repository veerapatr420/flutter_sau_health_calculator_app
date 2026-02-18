import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => BmrUiState();
}

class BmrUiState extends State<BmrUi> {
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  String gender = "male"; // ค่าเริ่มต้น
  double bmrResult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Text(
                  'คำนวณหาอัตราการเผาผลาญที่ร่างกายต้องการ (BMR)',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Image.asset(
                  'assets/images/bmr.png',
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),

                // เพศ
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("เพศ"),
                ),
                Row(
                  children: [
                    Radio(
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    Text("ชาย"),
                    Radio(
                      value: "female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    Text("หญิง"),
                  ],
                ),

                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("น้ำหนัก (kg)"),
                ),
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
                  child: Text("ส่วนสูง (cm)"),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: heightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'กรอกส่วนสูงของคุณ',
                  ),
                ),

                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("อายุ (ปี)"),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'กรอกอายุของคุณ',
                  ),
                ),

                SizedBox(height: 30.0),

                ElevatedButton(
                  onPressed: () {
                    double w = double.parse(weightCtrl.text);
                    double h = double.parse(heightCtrl.text);
                    int age = int.parse(ageCtrl.text);

                    setState(() {
                      if (gender == "male") {
                        bmrResult = 66 + (13.7 * w) + (5 * h) - (6.8 * age);
                      } else {
                        bmrResult = 655 + (9.6 * w) + (1.8 * h) - (4.7 * age);
                      }
                    });
                  },
                  child: Text(
                    'คำนวณ BMR',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(320, 60),
                    backgroundColor: Colors.deepOrange,
                  ),
                ),

                SizedBox(height: 20.0),

                ElevatedButton(
                  onPressed: () {
                    weightCtrl.clear();
                    heightCtrl.clear();
                    ageCtrl.clear();
                    setState(() {
                      bmrResult = 0;
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(320, 60),
                    backgroundColor: Colors.grey,
                  ),
                ),

                SizedBox(height: 20),

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
                        "BMR",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        bmrResult == 0 ? "-" : bmrResult.toStringAsFixed(2),
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
