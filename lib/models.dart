class Member {
  final int? id;
  final String name;
  final String email;
  final String start;
  final String end;

  const Member(
      {this.id,
      required this.name,
      required this.email,
      required this.end,
      required this.start});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email, 'start': start, 'end': end};
  }

  @override
  String toString() {
    return 'Member{id: $id, name: $name, email: $email, start: $start, end: $end}';
  }
}
