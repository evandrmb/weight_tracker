class User {
  final String uid;
  final String email;
  final String photoUrl;
  User(this.uid, this.email, this.photoUrl);

  bool get isAnonymous => email == null && photoUrl == null;
}
