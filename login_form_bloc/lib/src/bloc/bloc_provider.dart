import 'package:flutter/material.dart';
// import 'package:login_form_bloc/src/bloc/bloc.dart';

import 'dart:async';
 import 'package:login_form_bloc/src/bloc/validation.dart';
import 'package:rxdart/rxdart.dart';


class BlocProvider extends InheritedWidget{

  final _bloc = _Bloc();

BlocProvider({Key key,Widget child}) : super(key: key, child: child);
 
  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static _Bloc of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(BlocProvider)
    as BlocProvider) 
    ._bloc;
  }
}


class _Bloc with Validation {
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();

//adding values in the stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

//getting stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator);

      Stream<bool> get submitButtonStream =>
      Rx.combineLatest2(emailStream, passwordStream,(email,password){
return true;
      });

  dispose() {
    _emailController.close();
    _passwordController.close();
  }

  submit(){
    final email = _emailController.value;
    final password = _passwordController.value;
    print('Email : $email and Password : $password');
  }
}

// final bloc = _Bloc();
