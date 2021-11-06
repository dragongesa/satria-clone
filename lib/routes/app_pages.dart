// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:satria/app/modules/home/view/home_view.dart';
import 'package:satria/app/modules/initial/view/initial_view.dart';
import 'package:satria/app/modules/login/view/login_view.dart';
import 'package:satria/app/modules/register/view/register_view.dart';

part 'app_routes.dart';

class AppRoutes {
  AppRoutes._();

  static const String INITIAL = Routes.INITIAL;

  //list route
  static Map<String, Widget Function(BuildContext context)> routes = {
    Routes.INITIAL: (context) => InitialView(),
    Routes.HOME: (context) => HomeView(),
    Routes.REGISTER: (context) => RegisterView(),
    Routes.LOGIN: (context) => LoginView(),
  };
}
