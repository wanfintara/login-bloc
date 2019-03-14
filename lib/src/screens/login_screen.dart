import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          SizedBox(height: 25),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
          // onChanged: (String value) {
          //   bloc.changeEmail(value);
          // },
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.password,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return TextField(
            // obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          );
        });
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.cyan,
      onPressed: () {},
    );
  }
}
