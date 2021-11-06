import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String? label;
  final Color? color;
  const Badge({Key? key, this.label, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return label != null && label!.isNotEmpty
        ? Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              label!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ))
        : const SizedBox();
  }
}
