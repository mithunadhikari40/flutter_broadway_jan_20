import 'package:flutter/material.dart';
import 'package:login_form/screens/login_screen.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login app',
      home: LoginScreen(),
    );
  }
}