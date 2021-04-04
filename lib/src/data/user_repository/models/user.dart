class User {
  String username;
  // ignore: non_constant_identifier_names
  String first_name;
  String email;
  String password;
  Object account;

  User(
      {this.username,
      this.first_name,
      this.email,
      this.password,
      this.account});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      username: responseData['username'],
      first_name: responseData['first_name'],
      email: responseData['email'],
      account: responseData['account'],
      password: responseData['password'],
    );
  }
}

class Account {
  String cep;
  String endereco;
  String cnpj;

  Account({this.cep, this.endereco, this.cnpj});
}
