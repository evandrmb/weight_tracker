import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/modules/auth/domain/entities/user.dart';
import 'package:weight_tracker/modules/home/models/weight_register.dart';

class FetchWeightsRepository {
  final FirebaseFirestore _firestore;

  FetchWeightsRepository(this._firestore);

  Future<Either<String, List<WeightRegister>>> call(User user) async {
    try {
      final collection = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('weights')
          .get();

      final list = collection.docs
          .map((doc) => WeightRegister.fromMap(doc.data()))
          .toList();

      list.sort((a, b) => a.createdAt.compareTo(b.createdAt));

      return Right(list);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
