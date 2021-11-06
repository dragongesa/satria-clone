import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  final dynamic title;
  final Widget? leading;
  final List<Widget>? actions;

  const MainAppBar(
      {Key? key,
      this.automaticallyImplyLeading,
      this.title,
      this.leading = const BackButton(),
      this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: (title is String)
          ? Text(
              title ?? "Beranda",
              style: Constants.screenTitleStyle,
            )
          : title,
      titleTextStyle: Constants.screenTitleStyle,
      centerTitle: false,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(46);
}
