import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:weight_tracker/modules/auth/domain/entities/user.dart';

class SignInAnonymouslyRepository {
  final FirebaseAuth _auth;
  SignInAnonymouslyRepository(this._auth);

  Future<Either<String, User>> call() async {
    try {
      final result = await _auth.signInAnonymously();
      final user = result.user;
      return Right(User(user.uid, user.email, user.photoURL));
    } catch (e) {
      return Left(e.message);
    }
  }
}
