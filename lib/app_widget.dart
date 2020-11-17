import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Restart the app');
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
