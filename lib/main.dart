import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/db/model/data_model.dart';
import 'package:to_do_list_app/screens/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(ToDOListModelAdapter().typeId)) {
    Hive.registerAdapter(ToDOListModelAdapter());
  }
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: ScreenHome()));
}
