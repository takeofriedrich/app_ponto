import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_controller.dart';
import '../../app_module.dart';

part 'start_controller.g.dart';

@Injectable()
class StartController = _StartControllerBase with _$StartController;

abstract class _StartControllerBase with Store implements Disposable {
  final pageViewController = PageController();

  FirebaseApp db;

  _StartControllerBase() {
    _iniciaDb();
  }

  void _iniciaDb() async {
    db = await Firebase.initializeApp();
  }

  @override
  void dispose() {
    pageViewController.dispose();
  }
}
