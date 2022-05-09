import 'package:firebase_database/firebase_database.dart';
import '../data/location_notification.dart';

class LocationNotificationDao {
  final DatabaseReference _locationNotificationRef =
      FirebaseDatabase.instance.ref().child('locationNotification');

  void saveLocationNotification(LocationNotification locationNotification) {
    _locationNotificationRef.push().set(locationNotification.toJson());
  }

  Query getLocationNotification() {
    return _locationNotificationRef;
  }
}
