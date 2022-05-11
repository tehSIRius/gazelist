import 'package:firebase_database/firebase_database.dart';

import 'package:gazelist/model/user.dart';

class UserDao {
  final DatabaseReference _userRef =
      FirebaseDatabase.instance.ref().child('user');

  void saveUser(User user) {
    _userRef.push().set(user.toJson());
  }

  void updateUser(User user) {
    _userRef.update(user.toJson());
  }

  void deleteUser(User user) {
    _userRef.child(user.id).remove();
  }

  Query getUserQuery() {
    return _userRef;
  }
}
