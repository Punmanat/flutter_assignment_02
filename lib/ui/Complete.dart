import 'package:flutter/material.dart';
import '../model/todo.dart';

class Complete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CompleteState();
  }
}

class CompleteState extends State<Complete> {
  TodoProvider todo = TodoProvider();

  List<Todo> _doneItems = List();
  @override
  void initState() {
    super.initState();
    todo.open().then((r) {
      print("Success");
      getDones();
    });
  }

  void getDones() {
    todo.getDones().then((r) {
      setState(() {
        _doneItems = r;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              todo.deleteDone();
              getDones();
            },
          )
        ],
      ),
      body: _doneItems.length == 0
          ? Center(child: Text('No data found...'))
          : ListView(
              children: _doneItems.map((todoItem) {
                return CheckboxListTile(
                  title: Text(todoItem.title),
                  value: todoItem.done,
                  onChanged: (bool value) {
                    setState(() {
                      todoItem.done = value;
                      todo.setTodoDone(todoItem);
                      getDones();
                    });
                  },
                );
              }).toList(),
            ),
    );
  }
}
