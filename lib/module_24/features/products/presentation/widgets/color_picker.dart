import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onSelected});

  final List<String> colors;
  final Function(String) onSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColors;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: widget.colors.map((color) {
        return GestureDetector(
          onTap: (){
            _selectedColors = color;
            widget.onSelected(color);
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _selectedColors == color ? AppColors.themeColor : null,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(color,style: TextStyle(
              color: _selectedColors == color ? Colors.white : null,

            ),),
          ),
        );
      }).toList(),
    );
  }
}
