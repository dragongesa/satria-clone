import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satria/app/data/locals/db.dart';
import 'package:satria/app/modules/initial/cubit/initial_cubit.dart';

class InitialView extends StatefulWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  @override
  void initState() {
    context.read<InitialCubit>().checkCredentials().then((value) {
      if (DB.instance.auth.isNotEmpty) {
        if (DB.instance.auth.getAt(0)?.userData != null) {
          context.read<InitialCubit>().checkBiometrics();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 36,
          height: 36,
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
