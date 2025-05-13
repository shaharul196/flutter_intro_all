import 'package:flutter/material.dart';

class DevicePreviewall extends StatefulWidget {
  const DevicePreviewall({super.key});

  @override
  State<DevicePreviewall> createState() => _ExpandedallState();
}

class _ExpandedallState extends State<DevicePreviewall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded app'),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 14,),

            FractionallySizedBox(
              widthFactor: 0.8,
              // heightFactor: 0.4,
              child: Card(child: ElevatedButton(onPressed: (){}, child: Text('Submie'))),
            ),
            SizedBox(height: 15,),

            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue,width: 6,),
              ),
              height: 300,
              child: FractionallySizedBox(
                heightFactor: 0.5,
                child: Container(
                  color: Colors.green,
                  child: Center(child: Text('This is text')),
                ),
              ),
            ),

            Row(
              children: [
                // Flexible flutter
                Flexible(
                  flex: 2,
                  // fit: FlexFit.tight,
                  child: Container(
                    height: 100,
                    color: Colors.orange,
                  ),
                ),

                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),

            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: (){}, child: Text('man-1'))),
                Expanded(child: ElevatedButton(onPressed: (){}, child: Text('man-2'))),
                Expanded(child: ElevatedButton(onPressed: (){}, child: Text('man-3'))),

              ],
            ),
            SizedBox(height: 15,),

            Column(
              children: [
                Container(
                  // width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  // width: 100,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  // width: 300,
                  height: 100,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
