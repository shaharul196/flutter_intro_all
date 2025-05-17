import 'package:flutter/material.dart';

class stackin extends StatefulWidget {
  const stackin({super.key});

  @override
  State<stackin> createState() => _stackinState();
}

class _stackinState extends State<stackin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack page'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                width: 300,
                height: 160,
                color: Colors.indigoAccent,
                child: Image.asset(
                    'asset/facebook-76536_1280.png'),


              ),
              Text('This is text',style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),),

              ElevatedButton(onPressed: (){}, child: Text('Submit')),
              SizedBox(height: 20,),
              Container(

                  height: 300,
                  width: 300,
                  color: Colors.white,
                  child: Image.asset(
                    "asset/images.jpeg",
                    fit: BoxFit.fill,
                  ),
              ),

            ],
          ),

        ),



        
      );
      

  }
}
