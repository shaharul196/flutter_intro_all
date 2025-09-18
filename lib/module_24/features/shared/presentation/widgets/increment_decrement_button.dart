import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';

class IncrementDecrementButton extends StatefulWidget {
  const IncrementDecrementButton({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        _buildIncAndDecButton(Icons.remove, () {
          if (_currentValue > 1) {
            _currentValue--;
            widget.onChange(_currentValue);
            setState(() {});
          }
        }),
        Text(
          _currentValue.toString(),
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        _buildIncAndDecButton(Icons.add, () {
          _currentValue++;
          widget.onChange(_currentValue);
          setState(() {});
        }),
      ],
    );
  }

  Widget _buildIncAndDecButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}
