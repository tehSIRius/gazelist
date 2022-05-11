class TimeNotification {
  final String id;
  final DateTime time;
  final bool recurring;
  DateTime? period;

  TimeNotification(this.id, this.time, this.recurring, this.period);

  TimeNotification.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        time = DateTime.fromMillisecondsSinceEpoch(json['time']),
        recurring = json['recurring'],
        period = DateTime.fromMillisecondsSinceEpoch(json['period']);

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'time': time.millisecondsSinceEpoch,
        'recurring': recurring,
        'period': period?.millisecondsSinceEpoch
      };
}
