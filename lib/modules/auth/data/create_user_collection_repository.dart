import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/modules/auth/domain/entities/user.dart';

class CreateUserCollectionRepository {
  final FirebaseFirestore _firestore;

  CreateUserCollectionRepository(this._firestore);

  Future<Either<String, void>> call(User user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'created_at': DateTime.now(),
        'user_name': user.email ?? '',
      });

      return Right(null);
    } catch (e) {
      return Left(e.message);
    }
  }
}
