import 'package:flutter/material.dart';
import './Complete.dart';
import './Task.dart';

class Todo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoState();
  }
}

class TodoState extends State<Todo> {
  int _selectedPage = 0;
  final _pageOptions = [Task(), Complete()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted), title: Text("Task")),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all), title: Text("Completed"))
        ],
      ),
    );
  }
}

// DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Todo"),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () {
//                 Navigator.pushNamed(context, "/new");
//               },
//             )
//           ],
//         ),
//         bottomNavigationBar: Container(
//           color: Colors.white,
//           child: TabBar(
//             labelColor: Colors.black,
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.format_list_bulleted),
//                 text: "Task",
//               ),
//               Tab(
//                 icon: Icon(Icons.done_all),
//                 text: "Completed",
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             Center(
//               child: Text("Task"),
//             ),
//             Center(
//               child: Text("Complete"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
