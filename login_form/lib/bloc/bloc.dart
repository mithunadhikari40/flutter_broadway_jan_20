import 'dart:async';

import 'package:login_form/bloc/validation.dart';

class Bloc{
  final StreamController _emailController = StreamController();
  final StreamController _passwordController = StreamController();

  //getters for sink
 Function(String) get  changeEmail => _emailController.sink.add;
 Function(String) get changePassword =>_passwordController.sink.add;

 //gettters for Stream
 Stream<String> get emailStream => _emailController.stream.transform(emailValidator);
 Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator); 





  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}