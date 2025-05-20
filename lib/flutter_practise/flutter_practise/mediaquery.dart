import 'package:flutter/material.dart';

class mediain extends StatefulWidget {
  const mediain({super.key});

  @override
  State<mediain> createState() => _mediainState();
}

class _mediainState extends State<mediain> {
  @override
  Widget build(BuildContext context) {
    Size screenSize =MediaQuery.of(context).size;
    // double screenWidth =MediaQuery.of(context).size as double;
    double FontSize = screenSize.width>600 ? 32 : 18;
    double pixelRatio =MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      appBar: AppBar(
        title: Text('MediaQuery'),
        backgroundColor: Colors.purpleAccent,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenSize.width*0.5,
                height: screenSize.height*0.5,
                color: Colors.red,
                // child: Text('Pixel Ratio: $pixelRatio'),
                child: Text('This is text',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize,
                ),),
              ),
              SizedBox(height: 15,),

              Wrap(
               spacing: 8.0,
               runSpacing: 5.0,
               children: List.generate(50, (index){
                 return Chip(label: Text('Item $index'));
               }
              ),
              ),

              Wrap(
                spacing: 8.0,
                runSpacing: 5.0,
                children: List.generate(40, (index){
                  return Container(
                    color: Colors.orange,
                    height: 50,
                    width: 60,
                  );
                }
              )
              ),
              SizedBox(height: 10,),
              AspectRatio(
                  aspectRatio: 16/9,
                child: Container(
                color: Colors.red  ,
                ),
              ),
              SizedBox(height: 10,),
              AspectRatio(
                  aspectRatio:9/16,
                child: Container(
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10,),

              Row(
                 children: [
                  SizedBox(width: 10,),
                  Expanded(
                   child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blue), child: Text('Man-1',style: TextStyle(
                       color: Colors.white,
                   ),)),
                 ),
                 SizedBox(width: 10,),

                 Expanded(
                   child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blue), child: Text('Man-2',style: TextStyle(
                     color: Colors.white,
                   ),)),
                 ),
                 SizedBox(width: 10,),

                 Expanded(
                   child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blue), child: Text('Man-3',style: TextStyle(
                     color: Colors.white,
                   ),)),
                 ),
                 SizedBox(width: 10,),
                 // Flexible(
                 //   flex: 2,
                 //     child:Container(
                 //      color: Colors.orange,
                 //      height: 100,
                 //     )
                 // )
               ],
              ),
             Row(
               children: [
                 Flexible(
                     flex: 2,
                     child:Container(
                       color: Colors.orange,
                       height: 100,
                     )
                 ),

                 Flexible(
                     flex: 1,
                     child:Container(
                       color: Colors.red,
                       height: 100,
                     )
                 )
               ],
             ),
              SizedBox(height: 15,),
              
              FractionallySizedBox(
                widthFactor: 0.23,
                child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue), child: Text('Submit',style: TextStyle(
                  color: Colors.white,
                ),)),
              ),
              SizedBox(height: 15,),
              
              Container(

                margin: EdgeInsets.all(10),
                decoration:BoxDecoration(
                  border: Border.all(color: Colors.blue,width: 6)
                ),
                height: 300,
                child: FractionallySizedBox(
                  heightFactor: 0.5999,
                  child: Container(
                    color: Colors.orange,
                    child: Center(child: Text('This is text')),
                  ),
                ),
              )

            ],
          ),
        ),

      ),

    );
  }
}
