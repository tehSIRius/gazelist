class Attachment {
  final String id;
  final String resourceId;

  Attachment(this.id, this.resourceId);

  Attachment.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        resourceId = json['resourceId'];

  Map<String, Object?> toJson() =>
      <String, Object?>{'id': id, 'resourceId': resourceId};
}
