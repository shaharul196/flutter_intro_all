import 'package:flutter/material.dart';

class Alertinall extends StatefulWidget {
  const Alertinall({super.key});

  @override
  State<Alertinall> createState() => _AlertinallState();
}

class _AlertinallState extends State<Alertinall> {
  void AlertDialogBox(){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('This is title text'),
      content: Text('Are you sure?'),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('No')),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Yes')),
      ],
    ));
  }

  void AlertDialogBoxWithIcon(){
    showDialog(context: context, builder: (context)=>AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
       children: [
         Icon(Icons.warning,color: Colors.red,),
         SizedBox(width: 8,),
         Text('Warning'),
       ],
      ),
      content: Text('Something went wrong...!'),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('dismiss')),
      ],
    ));
  }

  void InstalationBlocked(){
    showDialog(context: context, builder: (context)=>AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title:Text('Instalation Blocked'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.warning,color: Colors.red,),
              Text('Fudle Admin'),
            ],
          ),
          SizedBox(height: 15,),
          Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry',style: TextStyle(color: Colors.grey),),
        ],
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Ok')),
      ],
    ));
  }

  void showSimpleDialog(){
    showDialog(context: context, builder: (context)=>SimpleDialog(
      title: Text('Simple dialog'),
      children: [
        SimpleDialogOption(
          child: Text('Option-1'),
          onPressed: ()=>Navigator.pop(context),
        ),
        SimpleDialogOption(
          child: Text('Option-2'),
          onPressed: ()=>Navigator.pop(context),
        ),
      ],
    ));
  }

  void showBottomSheetAlert(){
    showModalBottomSheet(context: context, builder: (context)=>Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Choose option',style: TextStyle(
            fontSize: 18,
          ),),
          ListTile(
            title: Text('Option-1'),
            onTap: ()=>Navigator.pop(context),
          ),
          ListTile(
            title: Text('Option-2'),
            onTap: ()=>Navigator.pop(context),
          ),
        ],
      ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog app'),
        backgroundColor: Colors.purpleAccent,
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              AlertDialogBox();
            },style:ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ) , child: Text('Alert Dialog',style: TextStyle(
              color: Colors.white,
            ),)),

            ElevatedButton(onPressed: (){
              AlertDialogBoxWithIcon();
            },style:ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ) , child: Text('Alert Dialog With Icon',style: TextStyle(
              color: Colors.white,
            ),)),

            ElevatedButton(onPressed: (){
              InstalationBlocked();
            },style:ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ) , child: Text('Instalation Blocked Icon',style: TextStyle(
              color: Colors.white,
            ),)),

            ElevatedButton(onPressed: (){
              showSimpleDialog();
            },style:ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ) , child: Text('Simple Dialog',style: TextStyle(
              color: Colors.white,
            ),)),

            ElevatedButton(onPressed: (){
              showBottomSheetAlert();
            },style:ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ) , child: Text('Bottom Sheet',style: TextStyle(
              color: Colors.white,
            ),)),

          ],
        ),
      ),
    );
  }
}
