import 'package:cloud_firestore/cloud_firestore.dart';

class Aluno {
  int _id = -1;
  String _nome = '';
  String _email = '';
  String _fase = '';
  String _matricula = '';
  String _curso = '';

  Aluno();

  Aluno.fromJson(String key, Map<dynamic, dynamic> json) {
    this._id = int.parse(key);
    this._curso = json['curso'] ?? '';
    this._email = json['email'] ?? '';
    this._fase = json['fase'] ?? '';
    this._matricula = json['matricula'] ?? '';
    this._nome = json['nome'] ?? '';
  }

  Map<String, dynamic> toJsonUpdate() {
    Map<dynamic, dynamic> json = Map<dynamic, dynamic>();
    json['curso'] = this._curso;
    json['nome'] = this._nome;
    json['fase'] = this._fase;
    json['matricula'] = this._matricula;
    json['email'] = this._email;
    return {this._id.toString(): json};
  }

  Map<String, dynamic> toJsonAdd() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json['curso'] = this._curso;
    json['nome'] = this._nome;
    json['fase'] = this._fase;
    json['matricula'] = this._matricula;
    json['email'] = this._email;
    return json;
  }

  int get id => _id;

  set id(int value) => _id = value;

  String get nome => _nome;

  set nome(String value) => _nome = value;

  String get email => _email;

  set email(String value) => _email = value;

  String get fase => _fase;

  set fase(String value) => _fase = value;

  String get matricula => _matricula;

  set matricula(String value) => _matricula = value;

  String get curso => _curso;

  set curso(String value) => _curso = value;

  @override
  String toString() {
    return 'Nome: $_nome';
  }
}
