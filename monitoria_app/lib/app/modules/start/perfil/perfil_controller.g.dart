// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PerfilController = BindInject(
  (i) => PerfilController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  final _$nomeBotaoAtom = Atom(name: '_PerfilControllerBase.nomeBotao');

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

  final _$perfilAtom = Atom(name: '_PerfilControllerBase.perfil');

  @override
  Perfil get perfil {
    _$perfilAtom.reportRead();
    return super.perfil;
  }

  @override
  set perfil(Perfil value) {
    _$perfilAtom.reportWrite(value, super.perfil, () {
      super.perfil = value;
    });
  }

  final _$_PerfilControllerBaseActionController =
      ActionController(name: '_PerfilControllerBase');

  @override
  dynamic cadastrarObservador(dynamic json) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.cadastrarObservador');
    try {
      return super.cadastrarObservador(json);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizarPerfil() {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.atualizarPerfil');
    try {
      return super.atualizarPerfil();
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeBotao: ${nomeBotao},
perfil: ${perfil}
    ''';
  }
}
