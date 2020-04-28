import 'package:flutter/material.dart';
import 'package:login_form_bloc/const.dart';
import 'package:login_form_bloc/src/bloc/bloc.dart';
import 'package:login_form_bloc/src/bloc/bloc_provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final  bloc = _Bloc();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
      ),
    );
  }
}
