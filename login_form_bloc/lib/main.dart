import 'package:flutter/material.dart';
import 'package:login_form_bloc/const.dart';
import 'package:login_form_bloc/src/bloc/bloc_provider.dart';
import 'package:login_form_bloc/src/login_screen.dart';
import 'package:login_form_bloc/src/setting.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _onRouteGenerateRoute,
      title: title,
      // home: Scaffold(
      //   body: BlocProvider(
      //     child: LoginScreen(),
      //   ),
      // ),
    );
  }

  Route _onRouteGenerateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (BuildContext context) {
        return BlocProvider(
          child: LoginScreen(),
        );
      });
    } else {
      return MaterialPageRoute(builder: (BuildContext context) {
        return SettingScreen();
      });
    }
  }
}
