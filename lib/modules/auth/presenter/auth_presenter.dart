import 'package:flutter/material.dart';
import 'package:weight_tracker/core/presenter/user_notifier.dart';
import 'package:weight_tracker/modules/auth/data/create_user_collection_repository.dart';
import 'package:weight_tracker/modules/auth/data/sign_in_anonymously_repository.dart';

enum AuthState { Initial, Loading, Sucess, Error }

class AuthPresenter extends ChangeNotifier {
  final SignInAnonymouslyRepository _signInAnonymouslyRepository;
  final CreateUserCollectionRepository _createUserCollectionRepository;
  final UserNotifier _user;

  AuthState state;

  AuthPresenter(this._signInAnonymouslyRepository,
      this._createUserCollectionRepository, this._user) {
    state = AuthState.Initial;
    notifyListeners();
  }

  void signInAnonymously() async {
    state = AuthState.Loading;
    notifyListeners();

    final result = await _signInAnonymouslyRepository();

    result.fold((l) {
      print(l);
      state = AuthState.Error;
      notifyListeners();
    }, (user) async {
      _user.changeUser(user);
      final collectionResult =
          await _createUserCollectionRepository(_user.value);

      collectionResult.fold((l) {
        print(l);
        state = AuthState.Error;
        notifyListeners();
      }, (_) {
        state = AuthState.Sucess;
        notifyListeners();
        // Navegar para home
      });
    });
  }
}
