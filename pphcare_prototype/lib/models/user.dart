class PPHCareUser {
  String firstName;
  String lastName;
  String email;
  String position;
  String uid;

  PPHCareUser(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.position,
      required this.uid});

  static fromMap(Map<String, dynamic> map) {
    return PPHCareUser(
        firstName: map['firstName'],
        lastName: map['lastName'],
        email: map['email'],
        position: map['position'],
        uid: map['uid']);
  }
}
