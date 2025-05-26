import 'package:flutter/material.dart';

class buildButton extends StatelessWidget {
  String text;
  Color ? color;
  final VoidCallback onclick;
  buildButton({
    super.key,
    required this.onclick,
    required this.color,
    required this.text,

  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor:color ??  Colors.grey[800],
            ),
            onPressed: onclick,
            child: Text(text,style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),)),
      ),
    );
  }
}
