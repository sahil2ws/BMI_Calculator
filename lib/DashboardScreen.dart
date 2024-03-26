import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchesControler = TextEditingController();
  var result = '';
  var bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    var totalInches = 0.0;
    var cm = 0.0;
    var tm = 0.0;
    var bmi = 0.0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: bgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Calculate your BMI',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('Please Enter Your Weight'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      prefixIcon: Icon(Icons.monitor_weight_rounded),
                    ),
                    keyboardType: TextInputType.number,
                    controller: weightController,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.6,
                    ),
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomRight: Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Height',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                label: Text('Feet'),
                              ),
                              controller: feetController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),

                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Inches',
                                labelStyle: TextStyle(fontSize: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              controller: inchesControler,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.cyan.shade300),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      var wt = weightController.text.toString();
                      var ft = feetController.text.toString();
                      var inc = inchesControler.text.toString();

                      if (wt != "" && ft != "" && inc != "") {
                        var iWT = double.parse(wt);
                        var iFT = double.parse(ft);
                        var iInch = double.parse(inc);

                        totalInches = (iFT * 12) + iInch;
                        cm = totalInches * 2.54;
                        tm = cm / 100;
                        bmi = iWT / (tm * tm);
                      } else {
                        setState(() {
                          result = 'Please Enter all Details';
                        });
                      }
                      if (bmi > 25) {
                        bgColor = Colors.red;
                        setState(() {
                          result =
                              'You are Overweight\n Your BMI is :${bmi.toStringAsFixed(2)}';
                        });
                      } else if (bmi >= 18 && bmi <= 25) {
                        bgColor = Colors.green;
                        setState(() {
                          result =
                              'You are Healthy\n Your BMI is :${bmi.toStringAsFixed(2)}';
                        });
                      } else if (bmi < 18 && bmi > 1) {
                        bgColor = Colors.orange;
                        setState(() {
                          result =
                              'You are Underweight\n Your BMI is :${bmi.toStringAsFixed(2)}';
                        });
                      } else {
                        bgColor = Colors.white;
                      }
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
