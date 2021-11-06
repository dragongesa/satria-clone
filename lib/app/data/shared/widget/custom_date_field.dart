import 'package:flutter/material.dart';

class CustomDateField extends StatelessWidget {
  final String? hintText;
  final Color? fillColor;
  final TextEditingController? dateController;
  final TextEditingController? timeController;
  final Function() onTapDate;
  final Function() onTapTime;
  final double dateWidth;
  final double timeWidth;
  final bool enabled;
  const CustomDateField(
      {Key? key,
      this.hintText,
      this.dateController,
      this.dateWidth = 180,
      this.timeController,
      this.timeWidth = 120,
      this.fillColor,
      required this.onTapDate,
      required this.onTapTime,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Visibility(
            visible: dateController != null,
            child: Container(
              child: TextFormField(
                  readOnly: true,
                  enabled: enabled,
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Select date', //hintText,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    filled: true,
                    fillColor: fillColor,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(.2),
                      ),
                    ),
                  ),
                  onTap: onTapDate),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          flex: 1,
          child: Visibility(
            visible: timeController != null,
            child: Container(
              child: TextFormField(
                  readOnly: true,
                  enabled: enabled,
                  controller: timeController,
                  decoration: InputDecoration(
                    hintText: 'Pick time', //hintText,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    filled: true,
                    fillColor: fillColor,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(.2),
                      ),
                    ),
                  ),
                  onTap: onTapTime),
            ),
          ),
        ),
      ],
    );
  }
}
