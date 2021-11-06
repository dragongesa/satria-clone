import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TToast {
  static error(String message, [BuildContext? context]) {
    if (context != null) {
      FToast fToast = FToast();
      fToast.init(context);
      fToast.showToast(child: cToast(message, 'error'));
      return;
    }
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
  }

  static success(String message, [BuildContext? context]) {
    if (context != null) {
      FToast fToast = FToast();
      fToast.init(context);
      fToast.showToast(child: cToast(message, 'success'));
      return;
    }
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.green);
  }

  static general(String message, [BuildContext? context]) {
    if (context != null) {
      FToast fToast = FToast();
      fToast.init(context);
      fToast.showToast(child: cToast(message, 'general'));
      return;
    }
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.black);
  }

  static Widget cToast(String message, String action) {
    Color color = Colors.black;
    if (action == "success") {
      color = Colors.greenAccent;
    } else if (action == "error") {
      color = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
