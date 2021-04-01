class User {
  int userId;
  String name;
  String email;

  User({this.userId, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      userId: responseData['userId'],
      email: responseData['email'],
      name: responseData['name'],
    );
  }
}
