import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/page/home_page.dart';
import 'package:to_do/provider/todos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Todo App';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFf6f5ee),
        ),
        home: const HomePage(),
      ));
}
