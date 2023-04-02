class User {
  final int id;
  final String name;
  final String mailAddress;
  final String comments;
  final String updatedAt;

  User(
      {required this.id,
      required this.name,
      required this.mailAddress,
      required this.comments,
      required this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      mailAddress: json['mail_address'],
      comments: json['comments'],
      updatedAt: json['latest_day'],
    );
  }
}
