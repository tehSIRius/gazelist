import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  final String id;
  final String title;
  final String content;
  final String owner;
  final DateTime created;
  final DateTime finished;

  final Map<String, bool> attachments;
  final Map<Stream, bool> lists;

  String? timeNotification;
  String? locationNotification;

  Task(
      this.id,
      this.title,
      this.content,
      this.owner,
      this.created,
      this.finished,
      this.attachments,
      this.lists,
      this.timeNotification,
      this.locationNotification);

  Task.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json['content'],
        created = DateTime.fromMicrosecondsSinceEpoch(json['created']),
        finished = DateTime.fromMicrosecondsSinceEpoch(json['finished']),
        attachments = json['attachments'],
        owner = json['owner'],
        lists = json['lists'],
        timeNotification = json['timeNotification'],
        locationNotification = json['locationNotification'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'id': id,
        'title': title,
        'content': content,
        'created': created.millisecondsSinceEpoch,
        'finished': finished.millisecondsSinceEpoch,
        'attachments': attachments,
        'owner': owner,
        'lists': lists,
        'timeNotification': timeNotification,
        'locationNotification': locationNotification
      };
}
