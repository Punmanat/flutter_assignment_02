import 'package:flutter/material.dart';
import './ui/TaskScreen.dart';
import './ui/NewScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {'/': (context) => Todo(), "/new": (context) => NewSubject()},
    );
  }
}
