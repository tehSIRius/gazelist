import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:gazelist/routes/login.dart';
import 'package:gazelist/routes/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _checkLogin() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  void _handleGoToCreateTask() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TaskPage()));
  }

  @override
  Widget build(BuildContext context) {
    _checkLogin();

    return Scaffold(
      body: FloatingActionButton(onPressed: _handleGoToCreateTask),
    );
  }
}
