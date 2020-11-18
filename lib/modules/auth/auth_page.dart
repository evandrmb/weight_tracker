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
            child: AnimatedBuilder(
              animation: presenter,
              builder: (context, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (presenter.state == AuthState.Initial)
                    RaisedButton(
                      onPressed: () {
                        presenter.signInAnonymously();
                      },
                      child: Text('Sign-in Anonymously'),
                    ),
                  if (presenter.state == AuthState.Loading)
                    CircularProgressIndicator(),
                  if (presenter.state == AuthState.Error) Text('Error'),
                ],
              ),
            )),
      ),
    );
  }
}
