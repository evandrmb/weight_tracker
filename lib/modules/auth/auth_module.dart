import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weight_tracker/core/presenter/user_notifier.dart';
import 'package:weight_tracker/modules/auth/data/create_user_collection_repository.dart';
import 'package:weight_tracker/modules/auth/presenter/auth_presenter.dart';
import 'package:weight_tracker/modules/home/home_module.dart';

import 'auth_page.dart';
import 'data/sign_in_anonymously_repository.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<FirebaseAuth>((i) => FirebaseAuth.instance),
        Bind((i) => SignInAnonymouslyRepository(Modular.get<FirebaseAuth>())),
        Bind((i) => AuthPresenter(i(), i(), Modular.get<UserNotifier>())),
        Bind((i) =>
            CreateUserCollectionRepository(Modular.get<FirebaseFirestore>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (context, args) => AuthPage(),
        ),
      ];
}
