import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoState();
  }
}

class TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todo"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, "/new");
              },
            )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.format_list_bulleted),
                text: "Task",
              ),
              Tab(
                icon: Icon(Icons.done_all),
                text: "Completed",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text("Task"),
            ),
            Center(
              child: Text("Complete"),
            ),
          ],
        ),
      ),
    );
  }
}
