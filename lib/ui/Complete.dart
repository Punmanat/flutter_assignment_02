import 'package:flutter/material.dart';

class Complete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CompleteState();
  }
}

class CompleteState extends State<Complete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          )
        ],
      ),
      body: Center(child: Text("No data found..")),
    );
  }
}
