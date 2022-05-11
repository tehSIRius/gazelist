import 'package:firebase_database/firebase_database.dart';

import 'package:gazelist/model/task_list.dart';
import 'package:gazelist/model/user.dart';

class TaskListDao {
  final DatabaseReference _taskListRef =
      FirebaseDatabase.instance.ref().child('taskList');

  void saveTaskList(TaskList taskList) {
    _taskListRef.push().set(taskList.toJson());
  }

  void updateTaskList(TaskList taskList) {
    _taskListRef.update(taskList.toJson());
  }

  void deleteTaskList(TaskList taskList) {
    _taskListRef.child(taskList.id).remove();
  }

  Stream<DatabaseEvent> getUsersTaskLists(User user) {
    return _taskListRef.child('owners').child(user.id).equalTo(true).onValue;
  }

  Query getTaskListQuery() {
    return _taskListRef;
  }
}
