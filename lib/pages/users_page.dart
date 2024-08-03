import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User List'),
          backgroundColor: Colors.blue[200],
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: ListView(
          children: List.generate(10, (index) => Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.person),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(100)),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: Text("User 1"),
                      ),
                      Container(
                        child: Text("234567"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        ));
  }
}
