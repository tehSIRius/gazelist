import 'package:firebase_database/firebase_database.dart';

import 'package:gazelist/model/location_notification.dart';

class LocationNotificationDao {
  final DatabaseReference _locationNotificationRef =
      FirebaseDatabase.instance.ref().child('locationNotification');

  void saveLocationNotification(LocationNotification locationNotification) {
    _locationNotificationRef.push().set(locationNotification.toJson());
  }

  void updateLocationNotification(LocationNotification locationNotification) {
    _locationNotificationRef.update(locationNotification.toJson());
  }

  void deleteLocationNotification(LocationNotification locationNotification) {
    _locationNotificationRef.child(locationNotification.id).remove();
  }

  Query getLocationNotification() {
    return _locationNotificationRef;
  }
}
