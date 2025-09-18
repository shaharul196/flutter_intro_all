

import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onSelected});

  final List<String> sizes;
  final Function(String) onSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: widget.sizes.map((size) {
          return GestureDetector(
            onTap: (){
              _selectedSize = size;
              widget.onSelected(size);
              setState(() {});
            },
            child: CircleAvatar(
              backgroundColor: _selectedSize == size ? AppColors.themeColor : Colors.grey.shade300,
              child: FittedBox(
                child: Text(size,style: TextStyle(
                  color: _selectedSize == size ? Colors.white : null,
                  fontSize: 16,

                ),),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
