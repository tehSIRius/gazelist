import 'package:firebase_database/firebase_database.dart';
import '../data/time_notification.dart';

class TimeNotificationDao {
  final DatabaseReference _timeNotificationRef =
      FirebaseDatabase.instance.ref().child('timeNotification');

  void saveTimeNotification(TimeNotification timeNotification) {
    _timeNotificationRef.push().set(timeNotification.toJson());
  }

  Query getTimeNotification() {
    return _timeNotificationRef;
  }
}
