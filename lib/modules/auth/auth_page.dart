import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/auth_presenter.dart';

class AuthPage extends StatelessWidget {
  final presenter = Modular.get<AuthPresenter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {},
                child: Text('Sign-in Anonymously'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
