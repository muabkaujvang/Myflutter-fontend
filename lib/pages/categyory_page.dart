import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/category_model_page.dart';
import 'package:flutter_application_1/pages/add_categyory_page.dart';

class CategyoryPage extends StatefulWidget {
  const CategyoryPage({super.key});

  @override
  State<CategyoryPage> createState() => _CategyoryPageState();
}

List<CategyoryPage> cateList = [];

class _CategyoryPageState extends State<CategyoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CategyoryPage"),
        backgroundColor: Colors.blue[200],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddCategyoryPage()),
              ).then(
                (value) {
                  setState(() {});
                },
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cateList.length,
              itemBuilder: (context, Index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  color: Index % 2 == 0 ? Colors.white : Colors.grey[200],
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('${Index + 1}'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('cateList[Index].'),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
