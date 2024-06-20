import 'package:flutter/material.dart';
import 'package:to_do_list_app/db/functions/db_functions.dart';
import 'package:to_do_list_app/screens/widgets/add_widget.dart';
import 'package:to_do_list_app/screens/widgets/list_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getAllData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 69, 201),
        leading: const Icon(
          Icons.today_rounded,
          color: Colors.white,
        ),
        title: const Text(
          'To-Do List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 205, 222, 245),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          height: size.height * 0.85,
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Expanded(child: ListItemsWidget()),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 67, 69, 201),
          foregroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Add to List'),
                alignment: Alignment.center,
                content: AddListWidget(),
              ),
            );
          }),
    );
  }
}
