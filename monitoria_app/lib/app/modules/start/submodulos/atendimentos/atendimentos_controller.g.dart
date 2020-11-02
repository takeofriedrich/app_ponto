// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atendimentos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AtendimentosController = BindInject(
  (i) => AtendimentosController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtendimentosController on _AtendimentosControllerBase, Store {
  final _$atendimentosAtom =
      Atom(name: '_AtendimentosControllerBase.atendimentos');

  @override
  Map<int, List<Atendimento>> get atendimentos {
    _$atendimentosAtom.reportRead();
    return super.atendimentos;
  }

  @override
  set atendimentos(Map<int, List<Atendimento>> value) {
    _$atendimentosAtom.reportWrite(value, super.atendimentos, () {
      super.atendimentos = value;
    });
  }

  final _$mesAtom = Atom(name: '_AtendimentosControllerBase.mes');

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

  final _$_AtendimentosControllerBaseActionController =
      ActionController(name: '_AtendimentosControllerBase');

  @override
  dynamic botaoDireita() {
    final _$actionInfo = _$_AtendimentosControllerBaseActionController
        .startAction(name: '_AtendimentosControllerBase.botaoDireita');
    try {
      return super.botaoDireita();
    } finally {
      _$_AtendimentosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic botaoEsquerda() {
    final _$actionInfo = _$_AtendimentosControllerBaseActionController
        .startAction(name: '_AtendimentosControllerBase.botaoEsquerda');
    try {
      return super.botaoEsquerda();
    } finally {
      _$_AtendimentosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
atendimentos: ${atendimentos},
mes: ${mes}
    ''';
  }
}
