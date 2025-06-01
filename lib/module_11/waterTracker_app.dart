import 'package:flutter/material.dart';

import '../widger/add_Water_Btn.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int CurrentInTake = 0;
  final int goal = 2000;

  void waterAdd(int amount){
    setState(() {
      CurrentInTake = (CurrentInTake + amount).clamp(0, goal);
    });
  }

  void resetWater(){
    setState(() {
      CurrentInTake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (CurrentInTake/goal).clamp(0.0, 1.0);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('Water Tracker app'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.7),
                      blurRadius: 10,
                      spreadRadius: 2
          
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Text("Today's InTank",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                    SizedBox(height: 6,),
                    // Text('2000 LTR')
                    Text('$CurrentInTake',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
          
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    child: CircularProgressIndicator(
                      // value:0-1 nibe
                      // value:0.5,
                      value: progress,
                      backgroundColor: Colors.grey.shade400,
                      color: Colors.blue.shade600,
                      strokeWidth: 9,
                    ),
                  ),

                  // Text('20%')
                  Text('${(progress*100).toInt()}%',
                  style: TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Wrap(
                spacing: 25,
                children: [
                  addWaterBtn(amount: 200, onClick: ()=>waterAdd(200), icon: Icons.local_drink,),
                  addWaterBtn(amount: 500, onClick: ()=>waterAdd(500), icon:Icons.local_drink,),
                  addWaterBtn(amount: 1000, onClick: ()=>waterAdd(1000), icon:Icons.local_drink,),
                ],
              ),
              SizedBox(height: 8,),
          
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(onPressed: ()=>resetWater(),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                  ), child: Text('Reset',
                   style: TextStyle(
                     fontSize: 25,
                     fontWeight: FontWeight.bold,
                     color: Colors.black,

                   ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


