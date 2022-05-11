import 'package:firebase_database/firebase_database.dart';

import 'package:gazelist/model/user.dart';

class UserDao {
  final DatabaseReference _userRef =
      FirebaseDatabase.instance.ref().child('user');

  void saveUser(User user) {
    _userRef.push().set(user.toJson());
  }

  Query getUserQuery() {
    return _userRef;
  }
}
