class Perfil {
  String _nome = '';
  String _disciplina = '';
  String _orientador = '';
  String _url = '';

  Perfil();

  Perfil.fromJson(Map<dynamic, dynamic> json) {
    this._nome = json['nome'] ?? '';
    this._disciplina = json['disciplina'] ?? '';
    this._orientador = json['orientador'] ?? '';
    this._url = json['photo'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['nome'] = this._nome;
    json['disciplina'] = this._disciplina;
    json['orientador'] = this._orientador;
    json['photo'] = this._url;
    return json;
  }

  String get nome => _nome;

  set nome(String value) => _nome = value;

  String get disciplina => _disciplina;

  set disciplina(String value) => _disciplina = value;

  String get orientador => _orientador;

  set orientador(String value) => _orientador = value;

  String get url => _url;

  set url(String value) => _url = value;
}
