import 'package:flutter/material.dart';
import 'package:login_form_bloc/src/bloc/bloc.dart' show Bloc;
import 'package:login_form_bloc/src/bloc/bloc_provider.dart';

class LoginScreen extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
  
  final  bloc = BlocProvider.of(context);

    return Scaffold(
          body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            buildEmailField(bloc),
            buildPasswordField(bloc),
            SizedBox(
              height: 16,
            ),
            buildSubmitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget buildEmailField( bloc) {
    
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
              labelText: 'Email address',
              hintText: 'you@example.com',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget buildPasswordField( bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return TextField(
            obscureText: true,
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText: snapshot.error),
          );
        });
  }

  Widget buildSubmitButton( bloc) {
    return StreamBuilder(
      stream: bloc.submitButtonStream,
      builder: (context, snapshot) {
        return Container(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.blue,
            child: Text("Submit"),
            // onPressed:!snapshot.hasData ? null : bloc.submit
            onPressed: (){
              Navigator.of(context).pushNamed('settting');
            },

          ),
        );
      }
    );
  }
}
