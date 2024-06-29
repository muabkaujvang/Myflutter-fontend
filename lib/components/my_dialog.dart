import 'package:flutter/material.dart';

class MyDialog {
  Future<void> warningDialog({
    required BuildContext context,
    required String tittle,
    required Function()? onYes,
  }) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Center(child: Text(tittle)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onYes,
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'),
              )
            ],
          )
        ],
      ),
    );
  }
}
