import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: Text('The first page'),
          backgroundColor: Colors.blue[200],
          centerTitle: true, 
         ),
    );
  }
}