import 'package:flutter/material.dart';

class projectsall extends StatefulWidget {
  const projectsall({super.key});

  @override
  State<projectsall> createState() => _projectsallState();
}

class _projectsallState extends State<projectsall> {
  final List<String> AllFlags =[
    'asset/BD.jpeg',
    'asset/argentina.png',
    'asset/canada.jpeg',
    'asset/images (5).jpeg',
    'asset/images.jpeg',
    'asset/man profile.jpeg',

  ];
  int flags(double width){
    if(width<768){
      return 2;
    }else if(width<1034){
      return 3;
    }else{
      return 4;
    }
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Size screenWidth = MediaQuery.of(context).size;
    // if(screenWidth<768){
    //  imageCount:2;
    // }else if(screenWidth<=1024)
    return Scaffold(
        appBar: AppBar(
          title: Text('Assignment'),
          backgroundColor: Colors.purpleAccent,
          centerTitle: true,
        ),

        body:Padding(
            padding:EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: AllFlags.length,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,

                ),

                itemBuilder: (context,index){
                  return Card(
                    elevation: 4,
                    child: Image.asset(AllFlags[index]),


                  );

                }

            )
        )
    );
  }
}
