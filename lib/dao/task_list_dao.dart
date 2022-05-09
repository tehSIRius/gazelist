import 'package:firebase_database/firebase_database.dart';
import '../data/task_list.dart';

class TaskListDao {
  final DatabaseReference _taskListRef =
      FirebaseDatabase.instance.ref().child('taskList');

  void saveTaskList(TaskList taskList) {
    _taskListRef.push().set(taskList.toJson());
  }

  Query getTaskListQuery() {
    return _taskListRef;
  }
}
