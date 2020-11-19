import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/modules/auth/domain/entities/user.dart';
import 'package:weight_tracker/modules/home/models/weight_register.dart';

class RegisterWeightRepository {
  final FirebaseFirestore _firestore;

  RegisterWeightRepository(this._firestore);

  Future<Either<String, WeightRegister>> call(
      User user, WeightRegister register) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('weights')
          .add(register.toMap());

      return Right(register);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
