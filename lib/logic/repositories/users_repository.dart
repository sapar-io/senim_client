import 'package:client/logic/firestore/references.dart';
import 'package:client/logic/firestore/rest_api.dart';
import 'package:client/logic/models/user.dart';

abstract class UsersRepository {
  Future<void> createUser({required User model});
}

class UsersRepositoryImpl implements UsersRepository {
  @override
  Future<void> createUser({required User model}) async {
    final ref = FirestoreRef.user(model.uid);
    return RestAPI.create(model.toFirestore(), ref);
  }
}
