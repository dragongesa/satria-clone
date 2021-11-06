import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GlowingScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return GlowingOverscrollIndicator(
        color: Theme.of(context).primaryColor,
        axisDirection: details.direction,
        showLeading: false,
        showTrailing: true,
        child: child);
  }
}
