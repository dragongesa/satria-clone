import 'package:flutter/material.dart';

class LabelField extends StatelessWidget {
  final String? label;
  final Widget field;

  const LabelField({Key? key, this.label, required this.field})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 5,
            )
          ],
          field,
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
