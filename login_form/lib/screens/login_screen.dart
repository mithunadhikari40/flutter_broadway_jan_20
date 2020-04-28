import 'package:flutter/material.dart';
import 'package:login_form/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  final Bloc bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            buildEmailField(),
            buildPasswordField(),
            Padding(
              padding: EdgeInsets.only(top: 16),
            ),
            buildSubmitButton()
          ],
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      onChanged: bloc.changeEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email address",
        hintText: "you@example.com",
      ),
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      onChanged: bloc.changePassword,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'password',
      ),
    );
  }

  Widget buildSubmitButton() {
    return Container(
      width: double.infinity,
      child: RaisedButton.icon(
        icon: Icon(Icons.ac_unit),
        label: Text("Submit"),
        onPressed: () {},
        color: Colors.blue[400],
        textColor: Colors.amber,
      ),
    );
  }
}
