import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _unitController = TextEditingController();

  String fromUnit = 'meter';
  String toUnit = 'cm';
  double result = 0.0;

  final Map<String, double> conversion = {
    "meter": 1.0,
    "cm": 100,
    "kilometer": 0.001,
    "inches": 39.37,
    "feet": 3.28,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
        backgroundColor: Colors.orange,
        centerTitle: true,

        /// toolbarHeight: 150,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Welcome to unit converter',style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20,),

            TextFormField(
              controller: _unitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter value',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: fromUnit,
                  items:
                      conversion.keys.map((unit) {
                        return DropdownMenuItem(value: unit, child: Text(unit));
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                    });
                  },
                ),

                Text('to'),

                DropdownButton<String>(
                  value: toUnit,
                  items:
                  conversion.keys.map((unit) {
                    return DropdownMenuItem(value: unit, child: Text(unit));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  calculate();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                ),
                child: Text('Convert'),
              ),
            ),

            SizedBox(height: 30,),
            Text('Result:$result',style: TextStyle(
              color: Colors.grey,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),),

            /// toUnit == 'kilometer' ? Text('Result: $result kilometer') : Text('Result:$result unknown'),
          ],
        ),
      ),
    );
  }

  void calculate(){
    double? input = double.tryParse(_unitController.text);

    result = input! * conversion[toUnit]! / conversion[fromUnit]! ;
    setState(() {});
  }

}
