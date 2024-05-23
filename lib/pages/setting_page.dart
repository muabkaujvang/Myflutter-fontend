import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      title: Center(child: Text('Are you sure?')),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                    (route) => false);
                              },
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
                },
                child: Text('Logout'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
