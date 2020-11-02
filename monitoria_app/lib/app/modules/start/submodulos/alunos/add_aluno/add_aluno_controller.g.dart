// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_aluno_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AddAlunoController = BindInject(
  (i) => AddAlunoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddAlunoController on _AddAlunoControllerBase, Store {
  final _$nomeBotaoAtom = Atom(name: '_AddAlunoControllerBase.nomeBotao');

  @override
  String get nomeBotao {
    _$nomeBotaoAtom.reportRead();
    return super.nomeBotao;
  }

  @override
  set nomeBotao(String value) {
    _$nomeBotaoAtom.reportWrite(value, super.nomeBotao, () {
      super.nomeBotao = value;
    });
  }

  final _$alunoAtom = Atom(name: '_AddAlunoControllerBase.aluno');

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

  final _$faseAtom = Atom(name: '_AddAlunoControllerBase.fase');

  @override
  int get fase {
    _$faseAtom.reportRead();
    return super.fase;
  }

  @override
  set fase(int value) {
    _$faseAtom.reportWrite(value, super.fase, () {
      super.fase = value;
    });
  }

  @override
  String toString() {
    return '''
nomeBotao: ${nomeBotao},
aluno: ${aluno},
fase: ${fase}
    ''';
  }
}
