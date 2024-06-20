import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/db/model/data_model.dart';

ValueNotifier<List<ToDOListModel>> toDoListNotifier = ValueNotifier([]);
Future<void> addtoDOList(ToDOListModel value) async {
  final toDOListDB = await Hive.openBox<ToDOListModel>('toDOList_db');
  final _id = await toDOListDB.add(value);
  value.id = _id;
  toDoListNotifier.value.add(value);
  toDoListNotifier.notifyListeners();
}

Future<void> getAllData() async {
  final toDOListDB = await Hive.openBox<ToDOListModel>('toDOList_db');
  toDoListNotifier.value.clear();
  toDoListNotifier.value.addAll(toDOListDB.values);
  toDoListNotifier.notifyListeners();
  // log(toDoListNotifier.value.toString());
}

Future<void> deleteToDoList(int id) async {
  final toDOListDB = await Hive.openBox<ToDOListModel>('toDOList_db');
  await toDOListDB.delete(id);
  getAllData();
}

Future<void> modify(int? id, String title, String details) async {
  final toDOListDB = await Hive.openBox<ToDOListModel>('toDOList_db');
  toDOListDB.put(id!, ToDOListModel(title: title, details: details));
  getAllData();
}
