import 'package:firebase_database/firebase_database.dart';

import 'package:gazelist/model/time_notification.dart';

class TimeNotificationDao {
  final DatabaseReference _timeNotificationRef =
      FirebaseDatabase.instance.ref().child('timeNotification');

  void saveTimeNotification(TimeNotification timeNotification) {
    _timeNotificationRef.push().set(timeNotification.toJson());
  }

  void updateTimeNotification(TimeNotification timeNotification) {
    _timeNotificationRef.update(timeNotification.toJson());
  }

  void deleteTimeNotification(TimeNotification timeNotification) {
    _timeNotificationRef.child(timeNotification.id).remove();
  }

  Query getTimeNotification() {
    return _timeNotificationRef;
  }
}
