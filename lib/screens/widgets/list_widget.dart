import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/db/functions/db_functions.dart';
import 'package:to_do_list_app/db/model/data_model.dart';
import 'package:to_do_list_app/screens/widgets/modify_widget.dart';

class ListItemsWidget extends StatefulWidget {
  const ListItemsWidget({super.key});

  @override
  State<ListItemsWidget> createState() => _ListItemsWidgetState();
}

class _ListItemsWidgetState extends State<ListItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: toDoListNotifier,
      builder: (ctx, ToDoList, child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = ToDoList[index];
              return ListTile(
                leading: Checkbox.adaptive(
                    tristate: true,
                    value: data.CheckBoxValue,
                    onChanged: (value) {
                      setState(() {
                        if (data.CheckBoxValue == null ||
                            data.CheckBoxValue == false) {
                          data.CheckBoxValue = true;
                          updateCheckBox(
                              data.id, data.title, data.details, true);
                        } else {
                          data.CheckBoxValue = false;
                          updateCheckBox(
                              data.id, data.title, data.details, false);
                        }
                      });
                    }),
                title: Text(
                  data.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(data.details),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (data.id != null) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Modify Item'),
                                alignment: Alignment.center,
                                content: ModifyListWidget(id: data.id),
                              ),
                            );
                          } else {
                            log('ToDoList ID is null .unable to Modify');
                          }
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 57, 150, 99),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (data.id != null) {
                            deleteToDoList(data.id!);
                          } else {
                            log('ToDoList ID is null .unable to delete');
                          }
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 243, 108, 98),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: ToDoList.length);
      },
    );
  }

  Future<void> updateCheckBox(
      int? id, String title, String details, bool? CheckBoxValue) async {
    final toDOListDB = await Hive.openBox<ToDOListModel>('toDOList_db');
    toDOListDB.put(
        id!,
        ToDOListModel(
            title: title, details: details, CheckBoxValue: CheckBoxValue));
    getAllData();
  }
}
