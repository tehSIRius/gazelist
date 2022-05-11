import 'package:flutter/cupertino.dart';
import 'package:gazelist/model/task.dart';

class TaskPage extends StatefulWidget {
  final Task? task;

  const TaskPage({Key? key, this.task}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _formKey = GlobalKey<FormState>();

  final _titleTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();

  final _focusTitle = FocusNode();
  final _focusDescription = FocusNode();
}
