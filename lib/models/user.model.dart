class UserEntity {
  final String uid;
  final String email;

  UserEntity({required this.uid, required this.email});

  bool isEmptyUser() => this.uid == '';
}
