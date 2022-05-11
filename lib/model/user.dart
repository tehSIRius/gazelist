class User {
  final String id;
  final String username;

  User(this.id, this.username);

  User.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        username = json['username'];

  Map<dynamic, dynamic> toJson() =>
      <dynamic, dynamic>{'id': id, 'username': username};
}
