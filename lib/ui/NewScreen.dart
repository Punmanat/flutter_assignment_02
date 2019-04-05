import 'package:flutter/material.dart';
import '../model/todo.dart';
import 'TaskScreen.dart';

class NewSubject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewSubjectState();
  }
}

class NewSubjectState extends State<NewSubject> {
  final _formkey = GlobalKey<FormState>();
  TodoProvider todo = TodoProvider();

  @override
  void initState() {
    super.initState();
    todo.open().then((r) {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController subject = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("New Subject")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: subject,
                decoration: InputDecoration(hintText: "Subject"),
                validator: (value) {
                  if (value.isEmpty) return "Subject is required";
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Save"),
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          Todo data = Todo(title: subject.text);
                          todo.insert(data).then((r) {
                            Navigator.pushReplacementNamed(context, "/");
                          });
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
