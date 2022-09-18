import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../data/sq_helper.dart';
import '../model/model_view.dart';


class DbProvider extends ChangeNotifier {
  DbProvider() {
    selectAllTaskProvider();

  }

  List<Model> task = [];

  fillTask(List<Model> task) {
    this.task = task;
    notifyListeners();
  }

  insetOneTask(Model model) async {
    await SqHeleper.sqHeleper.insertData(model);
    await selectAllTaskProvider();
  }

  selectAllTaskProvider() async {
    task = await SqHeleper.sqHeleper.selectAllDataPtovider();
  }

  updataOneTask(Model model) async {
// model.isComplet = !model.isComplet;
    await SqHeleper.sqHeleper.updataOneData(model);
    selectAllTaskProvider();
  }

  deleatOneTask(Model model) async {
    await SqHeleper.sqHeleper.delateOneData(model.id!);
    await selectAllTaskProvider();
  }
}