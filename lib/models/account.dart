class Account {
  String cep;
  String endereco;
  String cnpj;

  Account({this.cep, this.endereco, this.cnpj});

  Account.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    endereco = json['endereco'];
    cnpj = json['cnpj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['endereco'] = this.endereco;
    data['cnpj'] = this.cnpj;
    return data;
  }
}
