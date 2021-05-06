class Brand {
  bool dignidade;
  bool confianca;
  bool empoderamento;
  bool transformacao;
  bool cidadania;

  Brand(
      {this.dignidade,
      this.confianca,
      this.empoderamento,
      this.transformacao,
      this.cidadania});

  Brand.fromJson(Map<String, dynamic> json) {
    dignidade = json['dignidade'];
    confianca = json['confianca'];
    empoderamento = json['empoderamento'];
    transformacao = json['transformacao'];
    cidadania = json['cidadania'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dignidade'] = this.dignidade;
    data['confianca'] = this.confianca;
    data['empoderamento'] = this.empoderamento;
    data['transformacao'] = this.transformacao;
    data['cidadania'] = this.cidadania;
    return data;
  }
}
