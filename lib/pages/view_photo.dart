import 'package:flutter/material.dart';

class ViewPhoto extends StatelessWidget {
  const ViewPhoto({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              child: Image.network(imageUrl),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
