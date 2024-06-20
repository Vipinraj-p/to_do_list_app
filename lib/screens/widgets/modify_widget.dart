import 'package:flutter/material.dart';
import 'package:to_do_list_app/db/functions/db_functions.dart';
import 'package:to_do_list_app/db/model/data_model.dart';

const kHeight = SizedBox(height: 10);

class ModifyListWidget extends StatelessWidget {
  final int? id;
  ModifyListWidget({super.key, required this.id});
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
        valueListenable: toDoListNotifier,
        builder: (ctx, ToDoList, child) {
          return SizedBox(
            height: size.height * 0.3,
            width: size.width * 0.9,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Title'),
                ),
                kHeight,
                TextFormField(
                  controller: _detailsController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Details'),
                ),
                const Spacer(),
                ElevatedButton.icon(
                    onPressed: () {
                      onModifyButtonClicked(id);
                    },
                    icon: const Icon(Icons.edit_calendar_rounded),
                    label: const Text('Modify Item'))
              ],
            ),
          );
        });
  }

  Future<void> onModifyButtonClicked(int? id) async {
    final _title = _titleController.text;
    final _details = _detailsController.text;
    if (_title.isEmpty) {
      return;
    } else {
      modify(id, _title, _details);
    }
  }
}
