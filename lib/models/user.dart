import 'account.dart';

class User {
  String username;
  String firstName;
  String email;
  String password;
  Account account;

  User({this.username, this.firstName, this.email, this.account, this.password});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['first_name'];
    email = json['email'];
    password = json['password'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    return data;
  }
}
