import 'package:firebase_database/firebase_database.dart';

import 'package:gazelist/model/task.dart';
import 'package:gazelist/model/user.dart';

class TaskDao {
  final DatabaseReference _taskRef =
      FirebaseDatabase.instance.ref().child('task');

  void saveTask(Task task) {
    _taskRef.push().set(task.toJson());
  }

  void updateTask(Task task) {
    _taskRef.update(task.toJson());
  }

  void deleteTask(Task task) {
    _taskRef.child(task.id).remove();
  }

  Stream<DatabaseEvent> getUsersTask(User user) {
    return _taskRef.orderByChild('owner').equalTo(user.id).onValue;
  }

  Query getTaskQuery() {
    return _taskRef;
  }
}
