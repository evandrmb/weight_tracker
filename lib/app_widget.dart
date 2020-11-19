import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/presenter/app_presenter.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _presenter = Modular.get<AppPresenter>();

  @override
  void initState() {
    super.initState();
    _presenter.output.listen((event) {
      if (event) {
        Modular.to.pushReplacementNamed('/auth');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _presenter.closeFirebaseInitializedStream();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              _presenter.inputsAdded == 0) {
            _presenter.changeFirebaseInitializedStream(true);
          }

          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: MaterialApp(
              onGenerateRoute: Modular.generateRoute,
              initialRoute: Modular.initialRoute,
              navigatorKey: Modular.navigatorKey,
              theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.greenAccent[400],
              ),
            ),
          );
        },
      );
}
