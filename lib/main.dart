import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/page/home_page.dart';
import 'package:to_do/provider/todos.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  static const String title = 'Todo App';

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
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
        home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(Error);
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return const HomePage();
              }
              return CircularProgressIndicator();
            }),
      ));
}
