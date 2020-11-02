// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alunos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AlunosController = BindInject(
  (i) => AlunosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlunosController on _AlunosControllerBase, Store {
  final _$alsAtom = Atom(name: '_AlunosControllerBase.als');

  @override
  Map<String, Aluno> get als {
    _$alsAtom.reportRead();
    return super.als;
  }

  @override
  set als(Map<String, Aluno> value) {
    _$alsAtom.reportWrite(value, super.als, () {
      super.als = value;
    });
  }

  final _$_AlunosControllerBaseActionController =
      ActionController(name: '_AlunosControllerBase');

  @override
  void onUpdate(DocumentSnapshot event) {
    final _$actionInfo = _$_AlunosControllerBaseActionController.startAction(
        name: '_AlunosControllerBase.onUpdate');
    try {
      return super.onUpdate(event);
    } finally {
      _$_AlunosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
als: ${als}
    ''';
  }
}
