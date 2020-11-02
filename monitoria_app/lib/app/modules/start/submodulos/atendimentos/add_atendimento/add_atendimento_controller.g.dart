// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_atendimento_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AddAtendimentoController = BindInject(
  (i) => AddAtendimentoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddAtendimentoController on _AddAtendimentoControllerBase, Store {
  final _$horarioAtom = Atom(name: '_AddAtendimentoControllerBase.horario');

  @override
  int get horario {
    _$horarioAtom.reportRead();
    return super.horario;
  }

  @override
  set horario(int value) {
    _$horarioAtom.reportWrite(value, super.horario, () {
      super.horario = value;
    });
  }

  final _$mesAtom = Atom(name: '_AddAtendimentoControllerBase.mes');

  @override
  int get mes {
    _$mesAtom.reportRead();
    return super.mes;
  }

  @override
  set mes(int value) {
    _$mesAtom.reportWrite(value, super.mes, () {
      super.mes = value;
    });
  }

  final _$diaAtom = Atom(name: '_AddAtendimentoControllerBase.dia');

  @override
  int get dia {
    _$diaAtom.reportRead();
    return super.dia;
  }

  @override
  set dia(int value) {
    _$diaAtom.reportWrite(value, super.dia, () {
      super.dia = value;
    });
  }

  final _$motivoAtom = Atom(name: '_AddAtendimentoControllerBase.motivo');

  @override
  int get motivo {
    _$motivoAtom.reportRead();
    return super.motivo;
  }

  @override
  set motivo(int value) {
    _$motivoAtom.reportWrite(value, super.motivo, () {
      super.motivo = value;
    });
  }

  final _$alunoIndexAtom =
      Atom(name: '_AddAtendimentoControllerBase.alunoIndex');

  @override
  int get alunoIndex {
    _$alunoIndexAtom.reportRead();
    return super.alunoIndex;
  }

  @override
  set alunoIndex(int value) {
    _$alunoIndexAtom.reportWrite(value, super.alunoIndex, () {
      super.alunoIndex = value;
    });
  }

  final _$alunoAtom = Atom(name: '_AddAtendimentoControllerBase.aluno');

  @override
  Aluno get aluno {
    _$alunoAtom.reportRead();
    return super.aluno;
  }

  @override
  set aluno(Aluno value) {
    _$alunoAtom.reportWrite(value, super.aluno, () {
      super.aluno = value;
    });
  }

  final _$comAlunoAtom = Atom(name: '_AddAtendimentoControllerBase.comAluno');

  @override
  bool get comAluno {
    _$comAlunoAtom.reportRead();
    return super.comAluno;
  }

  @override
  set comAluno(bool value) {
    _$comAlunoAtom.reportWrite(value, super.comAluno, () {
      super.comAluno = value;
    });
  }

  final _$_AddAtendimentoControllerBaseActionController =
      ActionController(name: '_AddAtendimentoControllerBase');

  @override
  dynamic changeStates(Atendimento atendimento, int mes) {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.changeStates');
    try {
      return super.changeStates(atendimento, mes);
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementHorario() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.incrementHorario');
    try {
      return super.incrementHorario();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrementHorario() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.decrementHorario');
    try {
      return super.decrementHorario();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementDia() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.incrementDia');
    try {
      return super.incrementDia();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrementDia() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.decrementDia');
    try {
      return super.decrementDia();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementMes() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.incrementMes');
    try {
      return super.incrementMes();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrementMes() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.decrementMes');
    try {
      return super.decrementMes();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementaMotivo() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.incrementaMotivo');
    try {
      return super.incrementaMotivo();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrementaMotivo() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.decrementaMotivo');
    try {
      return super.decrementaMotivo();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nextAluno() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.nextAluno');
    try {
      return super.nextAluno();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic previouslyAluno() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.previouslyAluno');
    try {
      return super.previouslyAluno();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic trocaAluno() {
    final _$actionInfo = _$_AddAtendimentoControllerBaseActionController
        .startAction(name: '_AddAtendimentoControllerBase.trocaAluno');
    try {
      return super.trocaAluno();
    } finally {
      _$_AddAtendimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
horario: ${horario},
mes: ${mes},
dia: ${dia},
motivo: ${motivo},
alunoIndex: ${alunoIndex},
aluno: ${aluno},
comAluno: ${comAluno}
    ''';
  }
}
