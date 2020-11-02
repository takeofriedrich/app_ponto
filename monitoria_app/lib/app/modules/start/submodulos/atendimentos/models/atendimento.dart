class Atendimento {
  int _id = -1;
  int _dia = DateTime.now().day;
  int _motivo = 1;
  int _horario = 1;
  int _id_aluno = -1;

  Atendimento();

  Atendimento.withData(this._dia, this._horario, this._motivo, this._id);

  Atendimento.fromJson(String key, Map<dynamic, dynamic> json) {
    key != null ? this._id = int.parse(key) : this._id = -1;
    this._dia = json['dia'] ?? 1;
    this._horario = json['horario'] ?? 1;
    this._motivo = json['motivo'] ?? 1;
    this._id_aluno = json['aluno'] ?? -1;
  }

  Map<String, dynamic> toJsonUpdate() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json['aluno'] = this._id_aluno;
    json['dia'] = this.dia;
    json['horario'] = this._horario;
    json['motivo'] = this._motivo;
    return json;
  }

  Map<String, dynamic> toJsonAdd() {
    Map<String, dynamic> json = Map<String, dynamic>();
    json['aluno'] = this._id_aluno;
    json['dia'] = this.dia;
    json['horario'] = this._horario;
    json['motivo'] = this._motivo;
    return json;
  }

  int get id => _id;

  set id(int value) => _id = value;

  int get dia => _dia;

  set dia(int value) => _dia = value;

  int get motivo => _motivo;

  set motivo(int value) => _motivo = value;

  int get horario => _horario;

  set horario(int value) => _horario = value;

  int get id_aluno => _id_aluno;

  set id_aluno(int value) => _id_aluno = value;

  @override
  toString() =>
      'id $_id -  aluno: $_id_aluno - dia $_dia - horario $horario - motivo $_motivo';

  static final meses = {
    1: 'Janeiro',
    2: 'Fevereiro',
    3: 'Março',
    4: 'Abril',
    5: 'Maio',
    6: 'Junho',
    7: 'Julho',
    8: 'Agosto',
    9: 'Setembro',
    10: 'Outubro',
    11: 'Novembro',
    12: 'Dezembro'
  };

  static final horarios = {
    1: '07h30 - 08h20',
    2: '08h20 - 09h10',
    3: '09h20 - 10h10',
    4: '10h10 - 11h00',
    5: '11h00 - 11h50',
    6: '13h30 - 14h20',
    7: '14h20 - 15h10',
    8: '15h20 - 16h10',
    9: '16h10 - 17h00',
    10: '17h00 - 17h50',
    11: '18h10 - 19h00',
    12: '19h00 - 19h50',
    13: '19h50 - 20h40',
    14: '20h50 - 21h40',
    15: '21h40 - 22h30'
  };

  static final motivos = {
    0: 'Explicação de conteúdo da disciplina',
    1: 'Explicação de conteúdo de outra disciplina',
    2: 'Solução de exercícios (em geral)',
    3: 'Solução de exercícios para prova',
    4: 'Auxílio na preparação de material/experimentos para a disciplina'
  };

  compareTo(Atendimento a2) {
    return dia.compareTo(a2.dia);
  }
}
