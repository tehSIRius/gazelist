class TaskList {
  final String id;
  final String title;
  final String description;
  final DateTime created;

  final List<String> owners;

  TaskList(this.id, this.title, this.description, this.created, this.owners);

  TaskList.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        created = DateTime.fromMillisecondsSinceEpoch(json['created']),
        owners = json['owners'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'created': created.millisecondsSinceEpoch,
        'owners': owners
      };
}
