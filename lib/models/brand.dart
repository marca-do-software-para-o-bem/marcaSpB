class Brand {
  bool dignidade;
  bool confianca;
  bool empoderamento;
  bool transformacao;
  bool cidadania;
  bool solidezIndex;
  bool transformacaoIndex;
  bool uniaoIndex;
  int index;

  Brand({
    this.dignidade,
    this.confianca,
    this.empoderamento,
    this.transformacao,
    this.cidadania,
    this.solidezIndex,
    this.transformacaoIndex,
    this.uniaoIndex,
    this.index,
  });

  Brand.fromJson(Map<String, dynamic> json) {
    dignidade = json['dignidade'];
    confianca = json['confianca'];
    empoderamento = json['empoderamento'];
    transformacao = json['transformacao'];
    cidadania = json['cidadania'];
    solidezIndex = json['index'];
    transformacaoIndex = json['index'];
    uniaoIndex = json['index'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dignidade'] = this.dignidade;
    data['confianca'] = this.confianca;
    data['empoderamento'] = this.empoderamento;
    data['transformacao'] = this.transformacao;
    data['cidadania'] = this.cidadania;
    data['solidezIndex'] = this.cidadania;
    data['transformacaoIndex'] = this.cidadania;
    data['uniaoIndex'] = this.cidadania;
    data['index'] = this.index;

    return data;
  }
}
