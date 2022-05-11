class LocationNotification {
  final String id;
  final String location;
  final int radius;

  LocationNotification(this.id, this.location, this.radius);

  LocationNotification.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        location = json['location'],
        radius = json['radius'];

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'location': location,
        'radius': radius,
      };
}
