import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weight_tracker/core/presenter/user_notifier.dart';
import 'package:weight_tracker/modules/auth/auth_module.dart';

import 'app_widget.dart';
import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseFirestore.instance),
        Bind((i) => UserNotifier(null)),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => Container()),
        ModularRouter('/auth', module: AuthModule()),
        ModularRouter(
          '/home',
          module: HomeModule(),
        ),
      ];
}
