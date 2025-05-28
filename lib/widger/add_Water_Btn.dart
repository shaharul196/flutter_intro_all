import 'package:flutter/material.dart';

class addWaterBtn extends StatelessWidget {
  final int amount ;
  IconData ? icon;
  final VoidCallback onClick;
 addWaterBtn({
    super.key, required this.amount, required this.onClick,required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton.icon(onPressed: onClick,style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ), label: Text('+${amount} LTR',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
          icon: Icon(icon ?? Icons.water_drop,color: Colors.white,size: 25,),
        ),
      ),
    );
  }
}