import 'package:flutter/material.dart';

class SheetLabelField extends StatelessWidget {
  final String label;
  final Widget field;

  const SheetLabelField({Key? key, required this.label, required this.field})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        field,
        const SizedBox(height: 12),
      ],
    );
  }
}
