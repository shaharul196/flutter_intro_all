import 'package:flutter/material.dart';

void main() {
  runApp(BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BmiScreen());
  }
}

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double height = 170.0;
  double weight = 67.0;

  // TODO avabe get function lekha jay...get 1st braket() ney na
  // double get bmi {
  //   double heightInMeter = height / 100;
  //   return weight / (heightInMeter * heightInMeter);
  // }

  double bmi() {
    double heightInMeter = height / 100;
    return weight / (heightInMeter * heightInMeter);
  }

  String category() {
    double currentBmi = bmi();
    if (currentBmi < 18.5) return 'UnderWeight';
    if (currentBmi < 24.9) return 'Normal';
    if (currentBmi < 29.9) return 'OverWeight';
    return 'Obesity';
  }

  // String get category {
  //   double currentBmi = bmi();
  //   if (currentBmi < 18.5) return 'UnderWeight';
  //   if (currentBmi < 24.9) return 'Normal';
  //   if (currentBmi < 29.9) return 'OverWeight';
  //   return 'Obesity';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI App'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),

      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Height:${height.toInt()} cm'),
          Slider(
            value: height,
            min: 100,
            max: 220,
            divisions: 100,
            label: '${height.toInt()} cm',
            onChanged: (value) {
              setState(() {
                height = value;
              });
            },
          ),
          Text('Weight:${weight.toInt()} kg'),
          Slider(
            value: weight,
            min: 30,
            max: 150,
            divisions: 120,
            label: '${weight.toInt()} kg',
            onChanged: (value) {
              setState(() {
                weight = value;
              });
            },
          ),
          SizedBox(height: 40),
          Text(
            'Your BMI is: ${bmi().toStringAsFixed(1)}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            'Category: ${category()}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
