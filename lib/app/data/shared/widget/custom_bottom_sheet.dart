import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final String popupTitle;
  final Widget body;
  const CustomBottomSheet({
    Key? key,
    required this.popupTitle,
    required this.body,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 64,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Text(
              popupTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: body,
          ),
        ],
      ),
    );
  }
}
