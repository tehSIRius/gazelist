import 'package:firebase_database/firebase_database.dart';
import '../data/task.dart';
import '../data/user.dart';

class TaskDao {
  final DatabaseReference _taskRef =
      FirebaseDatabase.instance.ref().child('task');

  void saveTask(Task task) {
    _taskRef.push().set(task.toJson());
  }

  Stream<DatabaseEvent> getUsersTask(User user) {
    return _taskRef.orderByChild('owner').equalTo(user.id).onValue;
  }

  Query getTaskQuery() {
    return _taskRef;
  }
}
