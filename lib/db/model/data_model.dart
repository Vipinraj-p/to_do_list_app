import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class ToDOListModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  bool? CheckBoxValue;

  @HiveField(2)
  String title;

  @HiveField(3)
  String details;
  ToDOListModel(
      {required this.title,
      required this.details,
      this.id,
      this.CheckBoxValue});
}
