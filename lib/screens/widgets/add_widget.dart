import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_list_app/db/functions/db_functions.dart';
import 'package:to_do_list_app/db/model/data_model.dart';

const kHeight = SizedBox(height: 10);

class AddListWidget extends StatelessWidget {
  AddListWidget({super.key});
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                onAddButtonClicked();
              },
              icon: const Icon(Icons.add_task),
              label: const Text('Add to List'))
        ],
      ),
    );
  }

  Future<void> onAddButtonClicked() async {
    final _title = _titleController.text;
    final _details = _detailsController.text;
    if (_title.isEmpty) {
      return;
    } else {
      log('$_title $_details');
      final _toDoList = ToDOListModel(
          title: _title, details: _details, CheckBoxValue: false); //
      addtoDOList(_toDoList);
    }
  }
}
