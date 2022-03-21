import 'package:flutter/material.dart';
import 'package:to_do/main.dart';
import 'package:to_do/widget/add_to_dialog.dart';
import 'package:to_do/widget/todo_list.dart';
import 'package:to_do/widget/completed_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      const CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text(MyApp.title)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'Todos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done, size: 28), label: 'Completed')
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          builder: (context) => const AddTodoDialogWidget(),
          context: context,
          barrierDismissible: false,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
